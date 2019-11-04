module.exports = {
  PORT: process.env.PORT || 8080,
  topic: {
    NAME: 'test-topic',
    PARTITION: 0
  },
  RETRY_COUNTER: 3,
  topic_error: {
    NAME: 'db.postgres.error',
    PARTITION: 0,
    EMAIL: 'admin@abc.com'
  },
  SOURCE: 'INFORMIX',
  DESTINATION: 'POSTGRESQL',
  db: {
    URL: "postgres://postgres:password@127.0.0.1:54321/",
    OPTIONS: {
      logging: true,
      operatorsAliases: false,
      dialectOptions: { encrypt: true }
    },
    DB_NAME:['auditlog', 'testdb']
  },
  POSTGRES: {
    user: process.env.PG_USER || 'postgres',
    host: process.env.PG_HOST || 'localhost',
    database: process.env.PG_DATABASE || 'postgres', // database must exists before run tool
    password: process.env.PG_PASSWORD || 'password',
    port: parseInt(process.env.PG_PORT || 54321, 10),
  }
}
