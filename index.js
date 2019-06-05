global.Promise = require('bluebird');
const yargs = require('yargs');
const logger = require('./src/common/logger');
const migrateSchema = require('./src/migrate-schema');
const migrateData = require('./src/migrate-data');

const { argv } = yargs
  .example('$0 -s', 'migrate schema only')
  .example('$0 -d -t=<database1> -t=<database2> -v', 'migrate data in database1&database2')
  .example('$0 -a', 'migrate all data&schema')
  .option('s', {
    boolean: true,
    description: 'migrate schema',
    alias: 'migrate-schema',
  })
  .option('d', {
    boolean: true,
    description: 'migrate data',
    alias: 'migrate-data',
  })
  .option('a', {
    boolean: true,
    description: 'migrate schema&data',
    alias: 'migrate-all',
  })
  .option('t', {
    array: true,
    description: 'target database to migrate',
    alias: 'target',
  })
  .check(arg => arg.s || arg.d || arg.a)
  .help('h')
  .alias('h', 'help');

process
  .on('unhandledRejection', (reason) => {
    logger.error('Unhandled Rejection at Promise');
    logger.error(reason);
  })
  .on('uncaughtException', (err) => {
    logger.logFullError(err);
    process.exit(1);
  });
(async () => {
  try {
    if (argv.s || argv.a) {
      // migrate schema
      await migrateSchema(argv.t);
    }
    if (argv.d || argv.a) {
      // migrate data
      await migrateData(argv.t);
    }
  } catch (e) {
    logger.logFullError(e);
  }
})();
