#!/bin/bash

IMG_NAME=wagnermarques/fzl_liferay:0.0.1

CONTAINER_NAME=fzl_liferay7
CONTAINER_IP=192.168.33.160
CONTAINER_HOST_NAME=fzl_liferay7
MOUNT_TARGET_CONTAINER_SHARED_DIR=/container_shared_folder
MOUNT_SOURCE_CONTAINER_SHARED_DIR="$(pwd)"/container_shared_folder

docker run \
       --name $CONTAINER_NAME -d -p 8060:8080 \
       -h $CONTAINER_HOST_NAME \
       --net fzl_network_bridge --ip $CONTAINER_IP  $IMG_NAME

chmod 777 -R $MOUNT_SOURCE_CONTAINER_SHARED_DIR #fix this
echo Container name: $CONTAINER_NAME
echo Container ip: $CONTAINER_IP
echo Container ports:  8060:8080
echo MOUNT_SOURCE_CONTAINER_SHARED_DIR: $MOUNT_SOURCE_CONTAINER_SHARED_DIR
echo http://localhost:8086
