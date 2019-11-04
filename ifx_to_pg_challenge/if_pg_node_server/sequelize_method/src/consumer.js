const Kafka = require('no-kafka');
const Promise = require('bluebird');
const config = require('config');
const consumer = new Kafka.GroupConsumer();
const { consumerLog, cAuditLog } = require('./api/audit')
const { migrateDelete, migrateInsert, migrateUpdate } = require('./api/migrate')

const producer = new Kafka.Producer()

producer.init().then(function () {
  console.log('connected to local kafka server on port 9092 ...');
}
).catch(e => { console.log('Error : ', e) });

const dataHandler = function (messageSet, topic, partition) {
    return Promise.each(messageSet, async function (m) {
      const payload = JSON.parse(m.message.value)

      // insert consumer_log
      consumerLog({
        SEQ_ID: payload.SEQ_ID,
        TOPICNAME: topic,
        SCHEMA_NAME: payload.SCHEMANAME,
        CONSUMAER_QUERY: {
          OPERATION: payload.OPERATION,
          DATA: payload.DATA
        },
        DESTINATION: config.DESTINATION
      }).then(log => console.log('Add Consumer Log'))
        .catch(err => console.log(err))

      //update postgres table
      let postgreErr
      if(payload.OPERATION === 'INSERT') {
        let entity = payload.DATA
        await migrateInsert(entity, payload.SCHEMANAME, payload.TABLENAME)
          .catch(err => {
            postgreErr = err
            console.log(err)
          })

      } else if(payload.OPERATION === 'UPDATE') {
        await migrateUpdate(payload.DATA, payload.SCHEMANAME, payload.TABLENAME)
          .catch(err => {
            postgreErr = err
            console.log(err)
          })

      } else if(payload.OPERATION === 'DELETE') {
        let entity = payload.DATA
        await migrateDelete(entity, payload.SCHEMANAME, payload.TABLENAME)
          .catch(err => {
            postgreErr = err
            console.log(err)
          })

      }

      //audit success log
      if(!postgreErr){
      await cAuditLog({
        SEQ_ID: payload.SEQ_ID,
        CONSUMER_DEPLOY_STATUS: 'success',
        CONSUMER_UPDATE_TIME: Date.now()
      }).then(log => console.log('postgres '+ payload.OPERATION + ' success'))
        .catch(err => console.log(err))

      return consumer.commitOffset({ topic: topic, partition: partition, offset: m.offset, metadata: 'optional' })
      }

      //audit failure log
      await cAuditLog({
        SEQ_ID: payload.SEQ_ID,
        CONSUMER_DEPLOY_STATUS: 'failure',
        CONSUMER_FAILURE_LOG: postgreErr,
        CONSUMER_UPDATE_TIME: Date.now()
      }).then((log) => console.log('postgres '+ payload.OPERATION + ' failure'))
        .catch(err => console.log(err))

      let msgValue = {
        ...postgreErr,
        recipients: config.topic_error.EMAIL
      }
      //send postgres_error message
      await producer.send({
        topic: config.topic_error.NAME,
        partition: config.topic_error.PARTITION,
        message: {
            value : JSON.stringify(msgValue),
        }
        },{
          retries: {
            attempts: config.RETRY_COUNTER,
            delay: {
              min: 100,
              max: 300
            }
          }
        }).then(function (result) {
          console.log(result)
      })

      // commit offset
      return consumer.commitOffset({ topic: topic, partition: partition, offset: m.offset, metadata: 'optional' })
    }).catch(err => console.log(err))
};

const strategies = [{
    subscriptions: [config.topic.NAME],
    handler: dataHandler
}];

consumer.init(strategies);
