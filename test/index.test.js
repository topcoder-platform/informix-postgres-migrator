const execa = require('execa');
const _ = require('underscore');
const config = require('config');
const path = require('path');
const should = require('should');
const {
  createPool,
} = require('../src/common/postgresWrapper');
const {
  executeQueryAsync,
} = require('../src/common/informixWrapper');

const getIntArgs = (i, len) => Array.from(Array(len), () => ({ type: 'int', value: i }));
const runCli = async cmd => execa.shell(cmd, {
  cwd: path.join(__dirname, '../'),
});
const jiveDatabase = config.DATABASES.jive;
const jive = jiveDatabase.name;
const commonOltp = config.DATABASES.common_oltp.name;
describe('Test application', () => {
  it('Should output help information if pass -h', async () => {
    const { stdout, stderr } = await runCli('node index.js -h');
    should.exist(stdout);
    stdout.should.match(/migrate all data&schema/);
    stderr.should.be.empty();
  });
  it('Should throw error if no valid command option', async () => {
    try {
      await runCli('node index.js');
    } catch (e) {
      e.stdout.should.be.empty();
      should.exist(e.stderr);
      e.stderr.should.match(/migrate all data&schema/);
      e.stderr.should.match(/Argument check failed/);
    }
  });
  describe('Test migrate schema&data', () => {
    let defaultPool;
    let pgClient;
    let pools = {};
    const forumId = 8888;
    const getPool = (database) => {
      if (pools[database]) {
        return pools[database];
      }
      const databasePool = createPool(database);
      pools[database] = databasePool;
      return databasePool;
    };
    async function getCount(client, sql, params, raw = false) {
      const result = await client.query(sql, params);
      return raw ? result.rows : result.rows[0].count;
    }
    async function forceDropDatabase(database) {
      try {
        const databaseCount = await getCount(pgClient,
          config.TEST_SQLS.POSTGRES.count_database, [database]);
        if (databaseCount === 1) {
          //  disallow new connections
          await pgClient.query('update pg_database set datallowconn = $1 where datname = $2;', ['false', database]);
          await pgClient.query(`alter database ${database} connection limit 1;`);
          // terminate existing connections
          await pgClient.query('select pg_terminate_backend(pid) FROM pg_stat_activity where datname = $1;', [database]);
          // can drop database safely
          await pgClient.query(`drop database ${database};`);
        }
      } catch (e) {
        throw e;
      }
    }
    async function expectDatabase(database, exists) {
      const actual = await getCount(pgClient, config.TEST_SQLS.POSTGRES.count_database, [database]);
      const expected = exists ? 1 : 0;
      should.equal(actual, expected, `Database ${database} get not expected count result: expected=${expected}, actual=${actual}`);
    }
    async function expectTable(client, table, count, params) {
      let sql = `select count(*)::int as count from "${table}"`;
      const values = [];
      if (_.isObject(params)) {
        let index = 0;
        const names = Object.keys(params);
        sql += ` where ${names.map((k) => {
          const v = params[k];
          if (_.isNull(v)) {
            return `"${k}" is null`;
          }
          index += 1;
          return `"${k}"=$${index}`;
        }).join(' and ')}`;
        for (const name of names) {
          if (!_.isNull(params[name])) {
            values.push(params[name]);
          }
        }
      }
      should.equal(await getCount(client, sql, values), count, `Table ${table} got wrong expect ${count} result`);
    }
    async function expectSchema(database) {
      for (const [name, val] of Object.entries(config.DATABASES[database].count)) {
        const pool = getPool(database);
        if (name === 'tables') {
          // verify base tables, foreign tables, views
          const actual = await getCount(pool, config.TEST_SQLS.POSTGRES.count_tables, null, true);
          const getTableCount = (type) => {
            const found = actual.find(x => x.table_type === type);
            return found ? found.count : 0;
          };
          should.equal(getTableCount('BASE TABLE'), val.baseTables);
          should.equal(getTableCount('FOREIGN'), val.foreignTables);
          should.equal(getTableCount('VIEW'), val.views);
        } else if (name === 'triggers') {
          // verify triggers
          const triggerCount = await getCount(pool, config.TEST_SQLS.POSTGRES.count_triggers);
          should.equal(triggerCount, val);
        } else {
          // verify count of imported table records
          await expectTable(pool, name, val);
        }
      }
    }
    before(() => {
      defaultPool = createPool();
    });
    beforeEach(async () => {
      if (!pgClient) {
        pgClient = await defaultPool.connect();
      }
      for (const pool of Object.values(pools)) {
        await pool.end();
      }
      pools = {};
      // force drop database to have clean environment.
      await forceDropDatabase(jive);
      await forceDropDatabase(commonOltp);
      await expectDatabase(jive, false);
      await expectDatabase(commonOltp, false);
    });
    after(async () => {
      if (pgClient) {
        pgClient.release();
      }
      for (const pool of Object.values(pools)) {
        await pool.end();
      }
      if (defaultPool) {
        await defaultPool.end();
      }
    });
    it('Should migrate schema successfully', async () => {
      const { stdout } = await runCli('node index.js -s');
      stdout.should.not.match(/error/);
      // verify database created
      await expectDatabase(commonOltp, true);
      await expectDatabase(jive, true);
      // verify tables, data and etc
      await expectSchema(commonOltp);
      await expectSchema(jive);
      // verify foreign key constraints
      const pool = await getPool(jive);
      try {
        await pool.query('insert into jive_reply_to_identifiers values (1, \'\', 0, 1)');
        throw new Error('should not throw');
      } catch (e) {
        e.should.have.property('constraint', 'jive_reply_to_identifiers_msgid_fk');
      }
      // verify unique index constraints
      try {
        await pool.query('insert into jivegroup select 3, name, \'\', 0, 0 from jivegroup limit 1');
        throw new Error('should not throw');
      } catch (e) {
        e.should.have.property('constraint', 'name_unique_idx');
      }
      // verify function millis_to_time
      const actual = await pool.query(`select millis_to_time(${jiveDatabase.millis_to_time.input})::text as time`);
      should.equal(actual.rows[0].time, jiveDatabase.millis_to_time.output);
      // same as previous informix function
      const before = await executeQueryAsync(jive, `select to_char(millis_to_time(${jiveDatabase.millis_to_time.input}), '%Y-%m-%d %I:%M:%S') as time from systables where tabid = 1`);
      should.equal(actual.rows[0].time, before[0].time);
      // verify view
      const view = await pool.query('select * from jiveuser where username=\'heffan\' limit 1');
      should.equal(view.rows.length, 1);
      view.rows[0].should.have.property('userid', '132456');
      view.rows[0].should.have.property('email', 'foo@fooonyou.com');
      view.rows[0].should.have.property('passwordhash');
      view.rows[0].should.have.property('name');
      for (const prop of ['namevisible', 'emailvisible', 'creationdate', 'modificationdate']) {
        view.rows[0].should.have.property(prop, 0);
      }
      // verify trigger fired if insert into jivemessage successfully
      await expectTable(pool, 'foreign_corona_event', 0);
      await expectTable(getPool(commonOltp), 'corona_event', 0);
      await pool.query('insert into jivethread values(1, 7167, 0, 0, 0, 0, 0)');
      await pool.query('insert into jivemessage values(1, 0, 1, 7167, 0, 132456, \'\', \'\', 0, 0, 0, 0)');
      await expectTable(pool, 'foreign_corona_event', 1, { corona_event_type_id: 2, user_id: 132456 });
      await expectTable(getPool(commonOltp), 'corona_event', 1, { corona_event_type_id: 2, user_id: 132456 });
      await pool.query('delete from jivemessage where messageid=1');
      await pool.query('delete from jivethread where threadid=1');
      await runCli('node index.js -s');
      // run migration schema job again table records will not increase.
      await expectSchema(commonOltp);
      await expectSchema(jive);
    });
    it('Should fail to migrate data if database not created', async () => {
      const { stderr } = await runCli('node index.js -d');
      stderr.should.match(/Postgres database common_oltp not found/);
    });
    it('Should migrate data successfully', async () => {
      // migrate schema
      await runCli('node index.js -s');
      await expectDatabase(commonOltp, true);
      await expectDatabase(jive, true);
      await expectSchema(commonOltp);
      await expectSchema(jive);
      const results = {};
      const tables = ['template_project_forum', 'jiveuserperm', 'jiveuserprop', 'jiveid', 'jiveproperty', 'jivecategory', 'jiveforum', 'jivecategoryprop', 'jivegroup'];
      for (const table of tables) {
        results[table] = (await getPool(jive).query(`select * from "${table}"`)).rows;
      }
      // delete all records and import data from informix.
      for (const table of tables) {
        await getPool(jive).query(`delete from "${table}"`);
      }
      // migrate data
      const { stderr } = await runCli('node index.js -d');
      stderr.should.not.match(/error/);
      const newResults = {};
      for (const table of tables) {
        const newResult = await getPool(jive).query(`select * from "${table}"`);
        should.ok(newResult.rows.length >= results[table].length, `found not same length of rows in table ${table}}`);
        for (const row of results[table]) {
          // should found match record imported from informix database
          const found = newResult.rows.find(x => _.isEqual(x, row));
          should.ok(found, `found not match row in table ${table} for row[${JSON.stringify(row)}`);
        }
        newResults[table] = newResult.rows;
      }
      // run second time
      await runCli('node index.js -d');
      for (const table of tables) {
        const secondResult = await getPool(jive).query(`select * from "${table}"`);
        should.equal(secondResult.rows.length, newResults[table].length, 'import second time should not insert new records.');
      }
    });
    it('Should migrate schema & data successfully', async () => {
      await runCli('node index.js -a');
      await expectDatabase(commonOltp, true);
      await expectDatabase(jive, true);
      await executeQueryAsync(jive, `delete from jiveforum where forumid=${forumId}`); // clean up
      await executeQueryAsync(jive, 'delete from dual'); // clean up
      await getPool(jive).query(`delete from jiveforum where forumid=${forumId}`);
      await getPool(jive).query('delete from dual');
      await expectSchema(commonOltp);
      await expectSchema(jive);
      const results = {};
      const tables = ['template_project_forum', 'jiveuserperm', 'jiveuserprop', 'jiveid', 'jiveproperty', 'jivecategory', 'jiveforum', 'jivecategoryprop', 'jivegroup'];
      for (const table of tables) {
        results[table] = (await getPool(jive).query(`select * from "${table}"`)).rows;
      }
      // delete all records and import data from informix.
      for (const table of tables) {
        await getPool(jive).query(`delete from "${table}"`);
      }
      const { stderr } = await runCli('node index.js -a');
      stderr.should.not.match(/error/);
      const newResults = {};
      for (const table of tables) {
        const newResult = await getPool(jive).query(`select * from "${table}"`);
        should.ok(newResult.rows.length >= results[table].length, `found not same length of rows in table ${table}}`);
        for (const row of results[table]) {
          // should found match record imported from informix database
          const found = newResult.rows.find(x => _.isEqual(x, row));
          should.ok(found, `found not match row in table ${table} for row[${JSON.stringify(row)}`);
        }
        newResults[table] = newResult.rows;
      }
      // run second time
      await runCli('node index.js -a');
      for (const table of tables) {
        const secondResult = await getPool(jive).query(`select * from "${table}"`);
        should.equal(secondResult.rows.length, newResults[table].length, 'import second time should not insert new records.');
      }
      await expectTable(getPool(jive), 'jiveforum', 0, { forumid: 1, description: 'desc' });
      await executeQueryAsync(jive, 'insert into jiveforum(forumid, name, nntpname, description, moddefaultthreadval, moddefaultmsgval, creationdate, modificationdate, categoryid, categoryindex, forumindexcounter) values(?,?,?,?,?,?,?,?,?,?,?)',
        [{ type: 'int', value: forumId }, { type: 'string', value: 'testforum' }, { type: 'string', value: 'testnntpname' }, { type: 'string', value: 'desc' }].concat(getIntArgs(0, 7)));
      await runCli('node index.js -a');
      // new data imported
      await expectTable(getPool(jive), 'jiveforum', 1, { forumid: forumId, description: 'desc' });
      await executeQueryAsync(jive, `update jiveforum set description=null where forumid=${forumId}`);
      await runCli('node index.js -a');
      await expectTable(getPool(jive), 'jiveforum', 1, { forumid: forumId, description: null });
      await executeQueryAsync(jive, `delete from jiveforum where forumid=${forumId}`); // clean up
      await expectTable(getPool(jive), 'dual', 0);
      await executeQueryAsync(jive, 'insert into dual(value) values(1)');
      await runCli('node index.js -a');
      await expectTable(getPool(jive), 'dual', 1, { value: 1 });
      await executeQueryAsync(jive, 'update dual set value=null');
      await runCli('node index.js -a');
      await expectTable(getPool(jive), 'dual', 1, { value: null });
    });
  });
});
