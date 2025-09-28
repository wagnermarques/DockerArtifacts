#!/bin/bash
#https://hub.docker.com/_/mariadb/

CONTAINER_NAME=mysql8
HOST_PORT=3306

echo "Running... docker-run.sh <$CONTAINER_NAME> at host port <$HOST_PORT> and ip <$CONTAINER_IP>."

DATADIR="$HOME/mnt/ext4/VAR/DATA/data-dir-mysql-8-sga2"
mkdir -p $DATADIR

#--net fzl_network_bridge --ip $CONTAINER_IP  \
docker run \
       --name  $CONTAINER_NAME -h $CONTAINER_NAME  \
       -v $DATADIR:/var/lib/mysql \
       -v $(pwd)/sqlscripts:/sqlscripts \
       -p $HOST_PORT:3306 \
       -e MYSQL_ROOT_PASSWORD=admin123 \
       -d mysql:8.0.30 
