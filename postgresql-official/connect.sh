#!/bin/bash
CONTAINER_NAME=pgsql
USER=admin
PASSWD=admin123
docker exec -it $CONTAINER_NAME psql -U $USER --password
