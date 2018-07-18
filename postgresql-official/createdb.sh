#!/bin/bash
DB_NAME=$1

source ./pgsql_container_properties.sh

echo "[createdb.sh] shunning..."
./docker-exec.sh "createdb $DB_NAME"


