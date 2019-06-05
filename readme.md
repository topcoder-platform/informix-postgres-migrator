# Create PostgreSQL Schema And Tool For Migrate Data From Informix Database

## Build tools
- Node 8
- Java 8
- [Informix with tc-database-scripts](https://github.com/topcoder-platform/tc-database-scripts)
- Postgres(9.5+) some features like `CREATE INDEX IF NOT EXISTS`, `ON CONFLICT DO UPDATE` or upsert will only work since 9.5
- [node-pg-native](https://github.com/brianc/node-pg-native)
- [informix-wrapper](https://github.com/appirio-tech/informix-wrapper.git)
- Docker(no need to install Informix or Postgres server if using docker)

Please check some extra install steps to install [node-pg-native](https://github.com/brianc/node-pg-native) or [libpq](https://github.com/brianc/node-libpq)  successfully for example `sudo apt-get install libpq-dev g++ make` under Ubuntu/Debian.

I convert [sample informix schema](https://github.com/topcoder-platform/tc-database-scripts/blob/dev/jive/01_jive_main_schema.sql) in folder `tc-database-scripts/jive/01_jive_main_schema.sql` with same structure.

I made some extra changes by removing all revoke, and change `create table` to `create table if not exists` to meet postgres sql syntax and could run many times.
I did not use [Tablespaces](https://www.postgresql.org/docs/9.6/manage-ag-tablespaces.html) and you may add if you need to.

Please note I convert views,triggers,functions too with required tables in database `common_oltp` in `tc-database-scripts/jive/04_jive_synonyms_procedures_and_triggers.sql` .
Please note there is no `create synonym` function in postgres and I use similar postgres extension [postgres_fdw](https://www.postgresql.org/docs/current/postgres-fdw.html).

## Configuration

- `config/default.js`
 * `LOG_LEVEL`: string - the log level, you can change to debug level to see more logs
 * `LOG_FILE`: string - the path of log file
 * `BATCH_COUNT`: int - the batch count to process informix records
 * `INFORMIX_WRAPPER_MAPPING`: object - map informix column type to types supported by [informix-wrapper](https://github.com/appirio-tech/informix-wrapper.git)
 * `TC_DATABASE_SCRIPTS`: array - array of tc database scripts with path, name information
 * `SQLS`: object - sql files used in this tool
 * `INFORMIX`: object -informix connection configuration
 * `POSTGRES`: object - postgres connection configuration

- `config/test.js`
 * `DATABASES`: object - some useful checks used in test.
 * `TEST_SQLS`: object - some useful sqls used in test.

## Local Deployment
Install related tools and modify informix/postgres connection configurations to meet your environment.

Install node packages
```
npm i
```

lint codes
```
npm run lint
```

Please close postgres connect tool to avoid issue during test because it will drop and recreate database during test, although test exists force drop database codes but it may be not work in sometimes.
test codes
```
npm test
```
You may increase timeout during test in `test/mocha.opts` if your connection with informix/postgres is slow.

test codes with coverage
```
npm run test:cov
```

example command to migrate schema only
```
node index -s
```
example command to migrate data in database jive only
```
node index -d -t=jive
```
example command to migrate schema&data only
```
node index -a
```

You can run `node index -h` to check all possible command options.

You can find after migration schema&data job is done database `common_oltp` and `jive` is created with all tables,triggers, views,functions and can run many times.
You can also update rows in informix and then run migration process again postgres related rows will update too.
You can find information file`<database>-[informixInfo|postgreInfo].json` will also generated during migration data process.
You can check how `test/index.test.js` verify functions.

## Docker notes
To save your time I provide docker image you can build with `docker-compose build` and then run `docker-compose run migrator`,
You may have to run commands `npm install && npm run lint && npm test` again one by one after run `docker-compose run migrator` command.


