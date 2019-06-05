SELECT DISTINCT
     t.relname AS "tableName",
     a.attname AS "columnName",
     ixc.relname AS "indexName",
     pg_catalog.format_type(a.atttypid,a.atttypmod) AS "columnType",
     ix.indisunique,
     ix.indisprimary
FROM pg_attribute a
INNER JOIN  pg_class t ON t.oid = a.attrelid
INNER JOIN  pg_namespace n ON n.oid = t.relnamespace
LEFT JOIN pg_index ix ON t.oid = ix.indrelid AND a.attnum = ANY(ix.indkey)
LEFT JOIN  pg_class as ixc ON  ixc.oid = ix.indexrelid
WHERE a.attnum > 0 AND t.relkind = 'r'::char AND n.nspname = 'public'
ORDER BY t.relname,a.attname

