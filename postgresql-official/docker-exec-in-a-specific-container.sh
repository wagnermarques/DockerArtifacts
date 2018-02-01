#!/bin/bash
CONTAINER_NAME=$1
SQL=$2
PGPASSWORD='admin123';
docker exec -it $CONTAINER_NAME sh -c "psql -U postgres -d postgres  -c '$SQL'"
