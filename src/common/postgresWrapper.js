const config = require('config');
const _ = require('underscore');
const { Pool } = require('pg').native; // use native binding to have better performance you may use pure js binding require('pg') directly here
const createPool = (database) => !database ? new Pool(config.POSTGRES): new Pool(_.extend(config.POSTGRES, {database}));
/**
 * Extract postgres tables information from database.
 * @param client the client.
 */
async function extractPostgresTablesInfoAsync(client){
    const allPGTableColumns = await client.query({
        name: 'fetch-all-table-columns',
        text: config.SQLS.POSTGRES.all_columns
    });
    return _.map(_.groupBy(allPGTableColumns.rows, 'tableName'), (cols, tableName)=>({
        tableName,
        columnNames: _.uniq(cols.map(c=>c.columnName)),
        columnTypes:_.uniq(cols.map(c=>c.columnName)).map(x=> _.findWhere(cols, {columnName: x}).columnType),
        uniques: _.uniq(cols.filter(x=>x.indisunique).map(c=>({
            columnName: c.columnName,
            indexName: c.indexName
        }))),
        pks: _.uniq(cols.filter(x=>x.indisprimary).map(c=>c.columnName))
    }));
}

module.exports = {
    extractPostgresTablesInfoAsync,
    createPool
};
