const config = require('config');
const fs = require('fs-extra');
const path = require('path');
const logger = require('./common/logger');
const {
  createPool,
} = require('./common/postgresWrapper');

/**
 * Create database
 * @param client the client.
 * @param database the database.
 */
async function createDatabase(client, database) {
  const databaseCount = await client.query(config.SQLS.POSTGRES.count_database, [database]);
  if (databaseCount.rows[0].count === 0) {
    logger.debug(`create database ${database}`);
    await client.query(`create database ${database}`);
  }
}

/**
 * Get sorted sql files under directory.
 * @param dir the directory name.
 */
async function getSqls(dir) {
  const files = await fs.readdir(dir);
  return files.filter(x => x.indexOf('_') !== 1 && x.toLowerCase().endsWith('.sql'))
    .sort((f1, f2) => Number(f1.substring(0, f1.indexOf('_'))) - Number(f2.substring(0, f1.indexOf('_'))))
    .map(x => path.join(dir, x));
}

/**
 * Migrate schema from informix to postgres.
 * @param databases databases to migrate
 */
async function migrateSchema(databases) {
  let client;
  const defaultPool = createPool();
  try {
    client = await defaultPool.connect();
    for (const tcScript of config.TC_DATABASE_SCRIPTS) {
      const { database } = tcScript;
      if (databases && databases.length && !databases.includes(database)) {
        logger.debug(`Skip process ${database}`);
        continue;
      }
      await createDatabase(client, database);
      const sqls = await getSqls(tcScript.path);
      const pool = createPool(database);
      // switch to new created database
      let poolClient;
      try {
        poolClient = await pool.connect();
        await poolClient.query('BEGIN');
        await poolClient.query('SET session_replication_role = replica;'); // disable foreign key check
        for (const sql of sqls) {
          logger.debug(`run sql file "${path.basename(sql)}" in database "${database}"`);
          await poolClient.query(await fs.readFile(sql, 'utf-8'));
        }
        logger.debug(`Commit transaction to migrate schemas for database "${database}"`);
        await poolClient.query('COMMIT'); // only commit if no failure for any sql files in one database
        logger.info(`migrate schema for database "${database}" successfully`);
      } catch (e) {
        if (poolClient) {
          logger.debug(`Rollback transaction to migrate schemas for database "${database}"`);
          await poolClient.query('ROLLBACK');
        }
        throw e;
      } finally {
        logger.debug(`end connection of postgres for database "${database}"`);
        if (poolClient) {
          await poolClient.query('SET session_replication_role = DEFAULT;');
          poolClient.release();
        }
        await pool.end();
      }
    }
  } finally {
    logger.debug('release connection of postgres');
    if (client) {
      client.release();
    }
    await defaultPool.end();
  }
}

module.exports = migrateSchema;
