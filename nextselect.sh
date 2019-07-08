#!/bin/bash

log()
{
   echo "`date +'%D %T'` : $1" >> app.log
}


callnextselect()
{
    Searchtext=$1
    Replacetext=$2
    sed -i "s/$Searchtext/$Replacetext/" src/migrate-data.js
    log "nextselect call :  $Searchtext  to $Replacetext" 
    node index -d -t=informixoltp &  
    wait $!
    log "nextselect call :  Completed $Replacetext"
}

#callnextselect "between 11026 and 11050" "between 11051 and 12000"
#sleep 3
#callnextselect "between 11051 and 12000" "between 12001 and 13000"
#sleep 3
#callnextselect "between 12001 and 13000" "between 13001 and 14000"

callnextselect "between 13001 and 14000" "between 14001 and 15000"
sleep 3
callnextselect "between 14001 and 15000" "between 15001 and 16000"
sleep 3
callnextselect "between 15001 and 16000" "between 16001 and 16500"
sleep 3

callnextselect "between 16001 and 16500" "between 16501 and 16800"
sleep 3
callnextselect "between 16501 and 16800" "between 16801 and 17200"
sleep 3
callnextselect "between 16801 and 17200" "between 17201 and 17500"
sleep 3
callnextselect "between 17201 and 17500" "between 17501 and 18000"
sleep 3

echo "finishing"
