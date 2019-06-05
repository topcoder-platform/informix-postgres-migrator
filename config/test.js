module.exports = {
  LOG_LEVEL: 'debug',
  DATABASES: {
    jive: {
      name: 'jive',
      millis_to_time: {
        input: 1542000811067,
        output: '2018-11-12 05:33:31',
      },
      count: {
        tables: {
          baseTables: 52,
          foreignTables: 3,
          views: 1,
        },
        triggers: 1,
        template_project_forum: 1,
        jiveuserperm: 8,
        jiveuserprop: 1,
        jiveid: 17,
        jiveproperty: 240,
        jivecategory: 12,
        jiveforum: 15,
        jivecategoryprop: 20,
        jivegroup: 1,
      },
    },
    common_oltp: {
      name: 'common_oltp',
      count: {
        tables: {
          baseTables: 3,
          foreignTables: 0,
          views: 0,
        },
        triggers: 0,
        email: 34,
        user: 23,
      },
    },
  },
  TEST_SQLS: {
    POSTGRES: {
      count_database: 'select count(*)::int as count from pg_database where datname = $1',
      count_tables: 'select count(*)::int as count,table_type from information_schema.tables where table_schema=\'public\' group by table_type',
      count_triggers: 'select count(*)::int as count from pg_trigger where not tgisinternal',
    },
  },
};
