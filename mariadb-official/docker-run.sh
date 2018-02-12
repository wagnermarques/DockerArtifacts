#!/bin/bash
#https://hub.docker.com/_/mariadb/

CONTAINER_NAME=$1
HOST_PORT=$2
CONTAINER_IP=$3

if [ "x$CONTAINER_NAME" = "x" ]; then
    {
        CONTAINER_NAME=mariadb
        HOST_PORT=3306
        CONTAINER_IP=192.168.33.151
    }
fi

echo "Running... docker-run.sh <$CONTAINER_NAME> at host port <$HOST_PORT> and ip <$CONTAINER_IP>."

mkdir -p $(pwd)/../data-dir-for-mariadb/$CONTAINER_NAME #data dir is for each respective container name
DATADIR=$(pwd)/../data-dir-for-mariadb/$CONTAINER_NAME


docker run \
       --name  $CONTAINER_NAME -h $CONTAINER_NAME  \
       --net fzl_network_bridge --ip $CONTAINER_IP  \
       -v $DATADIR:/var/lib/mysql \
       -v $(pwd)/sqlscripts:/sqlscripts \
       -p $HOST_PORT:3306 \
       -e MYSQL_ROOT_PASSWORD=admin123 \
       -d mariadb:10.3 

