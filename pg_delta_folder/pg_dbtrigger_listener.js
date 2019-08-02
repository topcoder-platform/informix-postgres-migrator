var pg = require('pg'),
conString = 'tcp://postgres:postgres@localhost:5432/tcs_catalog',
pgClient;
console.log('LISTEN db_notifications');
pgClient = new pg.Client(conString);
pgClient.connect();
pgClient.query('LISTEN db_notifications');
pgClient.on('notification', function (data)
 {
    console.log("\033[34m" + new Date + '-\033[0m payload', data.payload);

  });
