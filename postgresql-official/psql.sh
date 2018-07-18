#!/bin/bash
#https://www.postgresql.org/docs/9.1/static/app-psql.html

PSQL_CMD=$1

source ./pgsql_container_properties.sh

echo "[psql.sh] Running..."
echo ./docker-exec.sh psql "$PSQL_CMD"
./docker-exec.sh "psql $PSQL_CMD"
