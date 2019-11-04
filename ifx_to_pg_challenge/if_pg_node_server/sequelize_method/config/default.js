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
  }
}
