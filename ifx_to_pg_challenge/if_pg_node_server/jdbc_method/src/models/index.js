const config = require('config')
const { Op } = require('sequelize')
const Sequelize = require('sequelize')

const db = {}
const models= {}

config.db.DB_NAME.forEach(dbname =>{
  db[dbname] = new Sequelize(config.db.URL + dbname,config.db.OPTIONS)
  models[dbname] = {}
  models[dbname].sequelize = db[dbname]
})

models['auditlog'].producer_log = db['auditlog'].import('./producer_log')
models['auditlog'].audit_log = db['auditlog'].import('./audit_log')
models['auditlog'].consumer_log = db['auditlog'].import('./consumer_log')
//models['testdb'].test = db['testdb'].import('./test')


models['auditlog'].audit_log.belongsTo(models['auditlog'].producer_log, { foreignKey: 'SEQ_ID' })
models['auditlog'].consumer_log.belongsTo(models['auditlog'].producer_log, { foreignKey: 'SEQ_ID' })

config.db.DB_NAME.forEach(dbname =>{
  db[dbname].sync({ force:false })
})

models.Sequelize = Sequelize
module.exports = models
