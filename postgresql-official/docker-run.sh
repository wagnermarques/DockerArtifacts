#!/bin/bash

CONTAINER_NAME=$1
HOST_PORT=$2
CONTAINER_IP=$3
IMG_NAME=$4

if [ "x$CONTAINER_NAME" = "x" ]; then
    {
        CONTAINER_NAME=pgsql
        HOST_PORT=5432
        CONTAINER_IP=192.168.33.162
        IMG_NAME=postgres:10.4
    }
fi

echo "Running... docker-run.sh -t <$CONTAINER_NAME> <$IMG_NAME> at host port <$HOST_PORT> and ip <$CONTAINER_IP>."

mkdir -p $(pwd)/../data-dir-for-postgresql/$CONTAINER_NAME #data dir is for each respective container name
DATADIR=$(pwd)/../data-dir-for-postgresql/$CONTAINER_NAME


docker run \
       --name $CONTAINER_NAME \
       -e POSTGRES_PASSWORD=admin123 \
       -e PGPASSWORD='admin123' \
       -e POSTGRES_USER=postgres \
       -e POSTGRES_PASSWORD=admin123 \
       -e PGHOST=$CONTAINER_NAME \
       -e PGPORT=$HOST_PORT \
       -e PGUSER=postgres \
       -h $CONTAINER_NAME  \
       --net fzl_network_bridge \
       --ip $CONTAINER_IP  \
       -v $DATADIR:/var/lib/postgresql/data \
       -v $(pwd)/sqlscripts:/sqlscripts \
       -p $HOST_PORT:5432 \
       -d $IMG_NAME


