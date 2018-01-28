#!/bin/bash

CONTAINER_NAME=$1
HOST_PORT=$2
CONTAINER_IP=$3

mkdir -p $(pwd)/../liferay7-containers-shared-dir/$CONTAINER_NAME #dir for each liferay containers shared folders
SHARED_FOLDER=$(pwd)/../liferay7-containers-shared-dir/$CONTAINER_NAME

if [ "x$CONTAINER_NAME" = "x" ]; then
    {
        CONTAINER_NAME=fzl_liferay7
        HOST_PORT=8060
        CONTAINER_IP=192.168.33.160
    }
fi

echo "Running... liferay7/docker-run.sh <$CONTAINER_NAME> at host port <$HOST_PORT> and ip <$CONTAINER_IP>."
IMG_NAME=wagnermarques/fzl_liferay:0.0.1


docker run \
       --name "$CONTAINER_NAME" -h "$CONTAINER_HOST_NAME" \
       --net fzl_network_bridge --ip "$CONTAINER_IP" \
       -v "$SHARED_FOLDER":/liferay7-containers-shared-dir/$CONTAINER_NAME \
       -p "$HOST_PORT":8080 \
       -d "$IMG_NAME"
       

echo Container name: $CONTAINER_NAME
echo Container ip: $CONTAINER_IP
echo Container host ports:  $HOST_PORT
echo SHARED_FOLDER: $SHARED_FOLDER
echo http://localhost:$HOST_PORT


