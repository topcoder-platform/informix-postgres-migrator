const dbs = require('../models')
const Sequelize = require('sequelize')
const Joi = require('Joi')

//Guess the type of str
function regTest(str) {
  if(typeof(str)==='object'||typeof(str)==='function')
    return 'JSON'
  else if(/^([+-]?)[1-9]\d{0，9}$/.test(str))
    return 'INTEGER'
  else if(/^([+-]?)\d+\.\d+$/.test(str))
    return 'FLOAT'
  else if(/^[\da-f]+$/.test(str)&&str.length%8==0)
    return 'BLOB'
  else return 'STRING'
}

//create Table if it is not exist
function createTable(payload, dbname, table) {
  let model = {}
  let keys = Object.keys(payload)
  let idExist = false
  keys.forEach(k =>{
    model[k] = {}
    if(k === 'id') {
      model[k].primaryKey = true
      idExist = true
    }
    model[k].type = Sequelize[regTest(payload[k])]
  })

  const m = dbs[dbname].sequelize.define(table, model, {
      tableName: table,
      paranoid: true,
      timestamps: false,
    })
  if(!idExist)
  m.removeAttribute('id')
  return m
}

//insert payload
async function migrateInsert(payload, dbname, table) {
  const db = dbs[dbname]
  if(!db) {
    return Promise.resolve().then(function () {
      throw new Error('db:' + schema + ' not found')
    })
  }

  if(!db[table]) {
    db[table] = createTable(payload, dbname, table)
    await db[table].sync({ force:false })
  }

  const model = db[table]
  return  model.create(payload)
}

//update payload
async function migrateUpdate(payload, dbname, table) {
  const db = dbs[dbname]
  if(!db) {
    return Promise.resolve().then(function () {
      throw new Error('db:' + schema + ' not found')
    })
  }

  let olddata = {}
  let newdata = {}
  Object.keys(payload).forEach((i) =>{
    olddata[i] = payload[i].old
    newdata[i] = payload[i].new
  })

  if(!db[table]) {
    db[table] = createTable(newdata, dbname, table)
    await db[table].sync({ force:false })
  }

  const model = db[table]
  return model.update(newdata, { where: olddata})
}

//delete payload.id
async function migrateDelete(payload, dbname, table) {
  const db = dbs[dbname]
  if(!db) {
    return Promise.resolve().then(function () {
      throw new Error('db:' + schema + ' not found')
    })
  }

  if(!db[table]) {
    db[table] = createTable(payload, dbname, table)
    await db[table].sync({ force:false })
  }

  const model = db[table]
  return model.destroy({
    where: payload
  })
}

module.exports = {
  migrateDelete,
  migrateInsert,
  migrateUpdate
}
