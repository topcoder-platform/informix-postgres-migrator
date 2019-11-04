const dbs = require('../models')
const Sequelize = require('sequelize')
const Joi = require('Joi')

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
}
//update payload
async function migratepgUpdate(dbpool, payload, dbname, table) {
  console.log(payload);
  try {
  const client = await dbpool.connect();
  //console.log("welcome123");
  const columnNames = Object.keys(payload)
  let schemaname = (dbname == 'testdb') ? 'public' : dbname;
  sql = `SET search_path TO ${schemaname};`;
  console.log(sql);
  await client.query(sql); 
  sql = `update ${table} set ${Object.keys(payload).map((key) => `${key}='${payload[key]}.new'`).join(', ')} where ${Object.keys(payload).map((key) => `${key}='${payload[key]}.old'`).join(' AND ')} ;` // "update <schema>:<table> set col_1=val_1, col_2=val_2, ... where primary_key_col=primary_key_val"
  console.log(sql);    
 // sql = "insert into test6 (cityname) values ('verygoosdsdsdsd');";
  await client.query(sql);  
  await client.release(true);
  console.log(`end connection of postgres for database`);
  } catch (e) {
        throw e;
  }
}

//delete payload.id
async function migratepgDelete(dbpool, payload, dbname, table) {

  console.log(payload);
  try {
  
  const client = await dbpool.connect();
  //console.log("welcome123");
  const columnNames = Object.keys(payload)
  let schemaname = (dbname == 'testdb') ? 'public' : dbname;
  sql = `SET search_path TO ${schemaname};`;
  console.log(sql);
  await client.query(sql); 
  sql = `delete from ${table} where ${Object.keys(payload).map((key) => `${key}='${payload[key]}.new'`).join('  AND  ')}  ;` // "delete query
  console.log(sql);    
 // sql = "insert into test6 (cityname) values ('verygoosdsdsdsd');";
  await client.query(sql);  
  await client.release(true);
  console.log(`end connection of postgres for database`);
  } catch (e) {
        throw e;
  }  
  
}

module.exports = {
  migratepgDelete,
  migratepgInsert,
  migratepgUpdate
}
