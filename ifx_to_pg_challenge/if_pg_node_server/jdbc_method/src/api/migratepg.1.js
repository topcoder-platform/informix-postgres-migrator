const dbs = require('../models')
const Sequelize = require('sequelize')
const Joi = require('Joi')




//Guess the type of str
function regTest(str) {
  if(typeof(str)==='object'||typeof(str)==='function')
    return 'JSON'
  else if(/^([+-]?)[1-9]\d*$/.test(str))
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
  keys.forEach(k =>{
    model[k] = {}
    if(k === 'id')
      model[k].primaryKey = true
    model[k].type = Sequelize[regTest(payload[k])]
  })

  return dbs[dbname].sequelize.define(table, model, {
      tableName: table,
      paranoid: false,
      timestamps: false,
    })
}

//insert payload
async function migratepgInsert(dbpool, payload, dbname, table) {
  console.log(payload);
  try {
  
  const client = await dbpool.connect();
  //console.log("welcome123");
  const columnNames = Object.keys(payload)
  let schemaname = (dbname == 'testdb') ? 'public' : dbname;
  sql = `SET search_path TO ${schemaname};`;
  console.log(sql);
  await client.query(sql); 
  sql = `insert into ${table} (${columnNames.join(', ')}) values (${columnNames.map((k) => `'${payload[k]}'`).join(', ')});` // "insert into <schema>:<table> (col_1, col_2, ...) values (val_1, val_2, ...)"
  console.log(sql);    
 // sql = "insert into test6 (cityname) values ('verygoosdsdsdsd');";
  await client.query(sql);  
  await client.release(true);
  console.log(`end connection of postgres for database`);
  } catch (e) {
        throw e;
  }
  
  //await client.query('SELECT NOW()')
 // 
}
//update payload
async function migratepgUpdate(dbpool, payload, dbname, table) {
  const db = dbs[dbname]
  if(!db) {
    return Promise.resolve().then(function () {
      throw new Error('db:' + schema + ' not found')
    })
  }
  // const columnNames = Object.keys(payload)
  // sql = `insert into ${table} (${columnNames.join(', ')}) values (${columnNames.map((k) => `'${payload[k]}'`).join(', ')});` // "insert into <schema>:<table> (col_1, col_2, ...) values (val_1, val_2, ...)"
  // console.log(sql);  
  // sql = `update ${table} set ${Object.keys(payload).map((key) => `${key}='${payload[key]}'`).join(', ')} where ${primaryKey}=${columns[primaryKey]};` // "update <schema>:<table> set col_1=val_1, col_2=val_2, ... where primary_key_col=primary_key_val"
  //(Object.keys(objdata).map(key => `${key} = '${objdata[key].new}'`)).join(', ')
  //(Object.keys(objdata).map(key => `${key} = '${objdata[key].old}'`)).join(' AND ')
  sql = `update ${table} set ${Object.keys(payload).map((key) => `${key}='${payload[key]}.new'`).join(', ')} where ${Object.keys(payload).map((key) => `${key}='${payload[key]}.old'`).join(', ')} ;` // "update <schema>:<table> set col_1=val_1, col_2=val_2, ... where primary_key_col=primary_key_val"

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
async function migratepgDelete(payload, dbname, table) {
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
  migratepgDelete,
  migratepgInsert,
  migratepgUpdate
}
