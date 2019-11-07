## How to setup tc-postgres-db

### Prerequisite 
- Docker-compose

### Setup
Clone this repo

`cd informix-postgres-migrator/tc-database-scripts`

`docker-compose up -d`

- Wait for 2 minutes for inital setup of postgres scripts and then verify.

`docker exec -it <containerid> bash`
- Verify for all schema is available. The following schema should be listed.

`psql -U postgres`

`postgres=# \dn`
 
 1. common_oltp    | postgres
 2. corporate_oltp | postgres
 3. informixoltp   | postgres
 4. jive           | postgres
 5. public         | postgres
 6. tcs_catalog    | postgres
 7. time_oltp      | postgres
 
 **Note :** Any changes to DB will persists even if docker container stops, as compose file has volume.

