#!/bin/bash
CONTAINER_NAME=$1
SQL=$2
docker exec -it $CONTAINER_NAME sh -c "mysql -uroot -padmin123 --execute='$SQL'"
