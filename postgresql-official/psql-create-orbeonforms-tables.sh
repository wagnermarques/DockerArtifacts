#!/bin/bash
#https://www.postgresql.org/docs/9.1/static/app-psql.html

echo "[psql-create-orbeonforms-tables.sh] Running..."

source ./pgsql_container_properties.sh

DB_NAME=$1
if [ "x$DB_NAME" = "x" ]; then
    echo "please inform in witch database orbeonforms tables should be created";    
    exit 1;
fi

./docker-exec.sh "psql -d $DB_NAME -a -f  /sqlscripts/orbeonforms-postgresql-2017_2.sql"

