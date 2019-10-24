## How to setup tc-postgres-db

### Prerequisite 
- Docker

### Setup
Clone this repo

cd informix-postgres-migrater/tc-database-scripts

`docker-compose up -d`

- wait for 2 minutes for inital setup of postgres scripts and then verify.

`docker exec -it <containerid> bash`
- verify for all schema is available. The following schema should be listed.

`psql -U postgres`

`postgres=# \dn`
 
 common_oltp    | postgres
 
 corporate_oltp | postgres
 
 informixoltp   | postgres
 
 jive           | postgres
 
 public         | postgres
 
 tcs_catalog    | postgres
 
 time_oltp      | postgres
 
 Note : A docker volume is create at docker-compose.yml. Any changes to DB will persists even if docker container stops.

