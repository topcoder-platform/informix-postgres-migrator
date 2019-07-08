const path = require('path');
const fs = require('fs');

module.exports = {
  LOG_LEVEL: process.env.LOG_LEVEL || 'debug',
  LOG_FILE: path.join(__dirname, '../app.log'),
  BATCH_COUNT: parseInt(process.env.BATCH_COUNT, 10) || 100,
  // will map to types supported by informix-wrapper, by default map to string
  INFORMIX_WRAPPER_MAPPING: {
    int: 'int',
    serial: 'int',
    text: 'text',
    lvarchar: 'text',
    decimal: 'float',
    float: 'float',
    byte: 'text',
    bigserial: 'int',
  },
  TC_DATABASE_SCRIPTS: [{
    database: 'informixoltp',
    path: path.join(__dirname, '../tc-database-scripts/informixoltp'),
  }, {
    database: 'jive',
    path: path.join(__dirname, '../tc-database-scripts/jive'),
  }],
  SQLS: {
    POSTGRES: {
      count_database: 'SELECT COUNT(*)::int AS count FROM pg_database WHERE datistemplate = false AND datname=$1',
      all_columns: fs.readFileSync(path.join(__dirname, '../sqls/get_all_postgres_columns.sql'), 'utf-8'),
    },
  },
  INFORMIX: {
    host: process.env.INFORMIX_HOST || 'localhost',
    port: parseInt(process.env.INFORMIX_PORT || 2021, 10),
    user: process.env.INFORMIX_USER || 'user',
    password: process.env.INFORMIX_PASSWORD || 'password',
    database: process.env.INFORMIX_DATABASE || 'database',
    server: process.env.INFORMIX_SERVER || 'informixserver',
    minpool: parseInt(process.env.MINPOOL, 10) || 1,
    maxpool: parseInt(process.env.MAXPOOL, 10) || 60,
    maxsize: parseInt(process.env.MAXSIZE, 10) || 0,
    idleTimeout: parseInt(process.env.IDLETIMEOUT, 10) || 3600,
    timeout: parseInt(process.env.TIMEOUT, 10) || 30000,
  },
  POSTGRES: {
    user: process.env.PG_USER || 'postgres',
    host: process.env.PG_HOST || 'localhost',
    database: process.env.PG_DATABASE || 'postgres', // database must exists before run tool
    password: process.env.PG_PASSWORD || 'postgres',
    port: parseInt(process.env.PG_PORT || 5432, 10),
  },
};
