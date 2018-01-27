#!/bin/bash
CONTAINER_NAME=sqlserver
USER=sa
PASSWD=admin123
docker exec -it $CONTAINER_NAME psql -U $USER --password
