const _ = require('underscore');
const config = require('config');
const fs = require('fs-extra');
const logger = require('./common/logger');
const {
  extractInformixTablesInfoAsync,
  executeQueryAsync,
} = require('./common/informixWrapper');
const {
  createPool,
  extractPostgresTablesInfoAsync,
} = require('./common/postgresWrapper');

/**
 * Migrate table
 * @param client the client.
 * @param database the database.
 * @param tableName the table name
 * @param informixTable the informix table.
 * @param postgresTable the postgres table.
 */
async function migrateTable(client, database, tableName, informixTable, postgresTable) {
  logger.debug(`migrate table "${tableName}" in "${database}"`);
  const { columnNames, columnTypes } = postgresTable;
  const conflictsColumns = _.uniq(postgresTable.uniques.map(x => x.columnName));
  const uniqueIndexes = _.uniq(postgresTable.uniques.map(x => x.indexName));
  const updateFields = _.difference(columnNames, conflictsColumns);
  const paramSql = Array.from(Array(columnNames.length).keys(), x => `$${x + 1}`).join(',');
  const insertSql = `insert into "${tableName}" (${columnNames.map(x => `"${x}"`).join(',')}) values(${paramSql})`;
  let times = 1;
  if (uniqueIndexes.length) {
    if (uniqueIndexes.length === 1) {
      logger.debug(`Process records with one unique constraint for table ${tableName} in ${database}`);
logger.info(`Process records with one unique constraint for table ${tableName} in ${database}`);
let sql = `${insertSql} on conflict (${conflictsColumns.map(x => `"${x}"`).join(',')}) do `;
      if (updateFields.length === 0) {
        sql += 'nothing';
      } else {
        sql += `update set ${updateFields.map(x => `"${x}"=excluded.${x}`).join(',')}`;
      }
      logger.info(`generate upsert sql with one unique constraint for postgres:\n${sql}`);
	while (true) {
        logger.info(`-------Starting  table "${tableName}" `);
        //logger.info(`select skip ${(times - 1) * config.BATCH_COUNT} limit ${config.BATCH_COUNT} * from ${tableName}`);
        const data = await executeQueryAsync(database, `select skip ${(times - 1) * config.BATCH_COUNT} limit ${config.BATCH_COUNT} * from ${tableName}`);
	if (!data.length) {
          break;
        }
        for (const row of data) {
          const values = [];
          columnNames.forEach((colName) => {
            values.push(row[colName]);
          });
          //logger.info(`Sql Values --- : \n${values}`);
          await client.query(sql, values);
        }
	logger.info(`Inserted "${(times) * config.BATCH_COUNT}" for table "${tableName}" successfully`);
        times += 1;
      }
    } else {
      logger.debug(`Process records with multi unique constraints for table "${tableName}" in "${database}"`);
      logger.info(`Process records with multi unique constraints for table "${tableName}" in "${database}"`);
console.log(`Process records with multi unique constraints for table "${tableName}" in "${database}"`);
      const functionName = `${database}_${tableName}_upsert`;
      const inputs = columnNames.map((x, i) => `v_${x.toLowerCase()} ${columnTypes[i]}`).join(',');
      const funcInsert = `insert into "${tableName}" (${columnNames.map(x => `"${x}"`).join(',')}) 
      values(${columnNames.map(x => `v_${x.toLowerCase()}`).join(',')});`;
      // filter with first unique constraint as where clause
      let whereColumns = postgresTable.pks;
      if (!whereColumns.length) {
        whereColumns = postgresTable.uniques
          .filter(x => x.indexName === uniqueIndexes[0]).map(x => x.columnName);
      }
      const setColumns = _.difference(columnNames, whereColumns);
      const funcUpdate = setColumns.length === 0 ? '' : `update "${tableName}" set ${setColumns.map(x => `"${x}"=v_${x.toLowerCase()}`).join(',')} 
                where ${whereColumns.map(x => `"${x}"=v_${x.toLowerCase()}`).join(' and ')};`;
      const funcSql = `
            --drop function if exists ${functionName};
            create or replace function ${functionName}(${inputs}) returns void as
            $$ begin 
               begin 
               ${funcInsert}
               exception when unique_violation then
               ${funcUpdate}
               end;
             return;
             end; $$ language plpgsql;`;
      logger.debug(`generate upsert function with multi unique constraints for postgres:\n${funcSql}`);
      await client.query(funcSql);
      while (true) {
        const data = await executeQueryAsync(database, `select skip ${(times - 1) * config.BATCH_COUNT} limit ${config.BATCH_COUNT} * from ${tableName}`);
        if (!data.length) {
          break;
        }
        for (const row of data) {
          const values = [];
          columnNames.forEach((colName) => {
            values.push(row[colName]);
          });
          await client.query(`select ${functionName}(${paramSql})`, values);
        }
	logger.info(`Inserted "${(times) * config.BATCH_COUNT}" for table "${tableName}" successfully`);
        times += 1;
      }
    }
  } else {
    logger.debug('Process records without unique columns(primary keys or unique indexes)');
    logger.info('------Inside Process records without unique columns(primary keys or unique indexes----)');
    const processed = [];
    //const informixColTypes = informixTable.columnTypes;
    //const informixColNames = informixTable.columnNames;
    while (true) {
      //const data = await executeQueryAsync(database, `select skip ${(times - 1) * config.BATCH_COUNT} limit ${config.BATCH_COUNT} * from ${tableName}`);
let nextselect = 0;

 const data = await executeQueryAsync(database, `select skip ${(times - 1) * config.BATCH_COUNT} limit ${config.BATCH_COUNT} * from ${tableName} where  image_id between 1 and 500000 `);
 
   // select skip 0 limit 5000 * from archive_sched_job_detail where sched_job_id < 9000; 
	 if (!data.length) {
        break;
      }
      for (const row of data) {
      //  if (processed.find(x => _.isEqual(x, row))) {
      //    logger.debug(`Already processed row[${JSON.stringify(row)}]`);
      //    continue;
      //  }

        const pvalues = [];
        columnNames.forEach((colName) => {
            const value = row[colName];
            if (!_.isUndefined(value)) {
                pvalues.push(row[colName]);
            }
            else
            {
                pvalues.push(null);
            }
        
        });
    /*    const fvalues = [];
        informixColTypes.forEach((colType, i) => {
          const value = row[informixColNames[i]];
          if (!_.isUndefined(value)) {
            fvalues.push({
              type: config.INFORMIX_WRAPPER_MAPPING[colType] || 'string',
              value,
            });
          }
        });
        const informixCountSql = `select count(*) as count from ${tableName} where ${informixColNames.map(x => (_.isUndefined(row[x]) ? `${x} is null` : `${x}=?`)).join(' and ')}`;
        const informixCount = await executeQueryAsync(database, informixCountSql, fvalues);
        const pvalues = columnNames.map(x => row[x]);
        let colIndex = 0;
        const postgresCountSql = `select count(*) as count from "${tableName}" where ${columnNames.map((x) => {
          if (_.isUndefined(row[x])) {
            return `"${x}" is null`;
          }
          colIndex += 1;
          return `"${x}"=$${colIndex}`;
        }).join(' and ')}`;
        const countValues = columnNames.filter(x => !_.isUndefined(row[x])).map(x => row[x]);
        logger.debug(`postgres count sql ${postgresCountSql} with values ${JSON.stringify(countValues)}`);
        logger.info(`postgres count sql ${postgresCountSql} with values ${JSON.stringify(countValues)}`);
        const postgresCount = await client.query(postgresCountSql, countValues); */
       // if (postgresCount.rows[0].count < informixCount[0].count) {
          // cannot track objects so will only insert because
         // for (let i = 0; i < informixCount[0].count - postgresCount.rows[0].count; i += 1) {
            //logger.debug(`postgres insert sql ${insertSql} with values[${JSON.stringify(pvalues)}`);
            //logger.info(`postgres insert sql ${insertSql} with values[${JSON.stringify(pvalues)}`);
            await client.query(insertSql, pvalues);
          //}
       // }
       // processed.push(row);
      }
	logger.info(`Inserted "${(times) * config.BATCH_COUNT}" for table "${tableName}" successfully`);
      times += 1;
    }
  }
}

/**
 * Migrate data from informix to postgres.
 * @param databases databases to migrate
 */
async function migrateData(databases) {
  const defaultPool = createPool();
  for (const tcScript of config.TC_DATABASE_SCRIPTS) {
    
      logger.info(`tcScript DB : ${tcScript.database}`);
      logger.info(`tcScript path: ${tcScript.path}`);
const { database } = tcScript;
      logger.debug(`DB Length ${databases.length}`);
      logger.debug(`${databases.includes(database)}`);
      //logger.debug(`${databases[database].name}`);
      logger.debug(`database: ${database}`);
    if (databases && databases.length && !databases.includes(database)) {
      logger.debug(`Skip process ${database}`);
      continue;
    }
    // make sure database exists at first
   logger.info(`database defaultpool : ${config.SQLS.POSTGRES.count_database}`); 
   logger.info(`database array ${[database].name}`); 
    const databaseCount = await defaultPool.query(config.SQLS.POSTGRES.count_database, [database]);
//    const databaseCount = await defaultPool.query(config.SQLS.POSTGRES.count_database, ['postgres']);
   logger.info(`databaseCount : ${databaseCount.rows[0].count}`); 
   logger.info(`database: ${databaseCount}`); 
//   await defaultPool.query('SET search_path TO common_oltp;');
    if (databaseCount.rows[0].count === 0) {
     throw new Error(`Postgres database ${database} not found, please run  migrate schema task at first!`);
    }
    
	logger.debug(`Postgres database ${database} exists`);
	const pgdb = "postgres"    
//const pool = createPool(database);
const pool = createPool(pgdb);
    const poolClient = await pool.connect();
    await poolClient.query('SET search_path TO informixoltp;');
    const informixInfo = await extractInformixTablesInfoAsync(database);
    const postgresInfo = await extractPostgresTablesInfoAsync(pool);
    // generate info files to help to understand structure of tables in informix and postgres
    await fs.writeFile(`${tcScript.database}-informixInfo.json`, JSON.stringify(informixInfo, null, 2));
    await fs.writeFile(`${tcScript.database}-postgresInfo.json`, JSON.stringify(postgresInfo, null, 2));
    const informixTables = _.indexBy(informixInfo, 'tableName');
    const postgresTables = _.indexBy(postgresInfo, 'tableName');
    try {
      await poolClient.query('begin');
      await poolClient.query('SET session_replication_role = replica;'); // disable foreign key check
      	let tablecount=0
	for (const [tableName, informixTable] of Object.entries(informixTables)) {
         tablecount = tablecount + 1
	logger.info(`------Current table "${tableName}" Count: "${tablecount}"`);
//	if (tablecount > 349 )
        //if (tableName === "submission_image" || tableName === "project_spec" || tableName === "review_item_comment" || tableName === "project_studio_specification" )
	//if (tableName === "project_spec")
        if (tableName === "image")
	{	
	/*if (tableName === "archive_sched_job_detail" || tableName === "system_test_result" || tableName === "command_execution" || tableName === "long_system_test_result" || tableName === "image"  || tableName === "path" || tableName === "connection_history" || tableName === "chat_history" || tableName === "compilation_class_file" || tableName === "long_submission" || tableName === "long_submission_class_file" || tableName === "resume" || tableName === "submission_class_file" )	
	{
		logger.info(`skipping table "${tableName}" : "${tablecount}"`);
		continue;
	}
*/
	if (!postgresTables[tableName]) {
          logger.warn(`No postgres table "${tableName}" in database "${database}"`);
          continue;
        }
        // lock table to avoid possibility for race condition
        await poolClient.query(`lock table "informixoltp"."${tableName}" in share row exclusive mode;`);
	await migrateTable(poolClient, database, tableName,
          informixTable, postgresTables[tableName]);
        logger.info(`migrate data for table ${tableName} in database "${database}" successfully`);
      }
	} //comment for skipping tables.
      await poolClient.query('commit');
      logger.info(`migrate data for database "${database}" successfully`);
    } catch (e) {
      if (poolClient) {
        logger.debug(`Rollback transaction to migrate data for database "${database}"`);
        await poolClient.query('rollback');
      }
      throw e;
    } finally {
      await poolClient.query('SET session_replication_role = DEFAULT;');
    }
    logger.debug(`end connection of postgres for database "${database}"`);
    poolClient.release();
    await pool.end();
  }
  await defaultPool.end();
}
module.exports = migrateData;
