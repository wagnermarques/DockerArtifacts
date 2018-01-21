#!/bin/bash

IMG_NAME=wagnermarques/fzl_eclipse-jee-oxigen-jdk8-fed27:0.0.1;

CONTAINER_NAME=fzl_eclipse;
CONTAINER_IP=192.168.33.158
MOUNT_TARGET_CONTAINER_SHARED_DIR=/container_shared_folder
MOUNT_SOURCE_CONTAINER_SHARED_DIR="$(pwd)"/$CONTAINER_SHARED_FOLDER

mkdir -p $MOUNT_SOURCE_CONTAINER_SHARED_DIR/workspace
HOST_DIR_FOR_WORKSPACE=$MOUNT_SOURCE_CONTAINER_SHARED_DIR/container_shared_folder/workspace

docker run \
       --name $CONTAINER_NAME -d -p 5903:5901 \
       -h fzl_eclipse -v $HOST_DIR_FOR_WORKSPACE:/default_workspace \
       --net fzl_network_bridge --ip $CONTAINER_IP  $IMG_NAME

chmod 777 -R $MOUNT_SOURCE_CONTAINER_SHARED_DIR #fix this
echo Container name: $CONTAINER_NAME
echo Container ip: $CONTAINER_IP
echo Container ports:  5903:5901
echo Use it: vncviewer $CONTAINER_IP:1
echo MOUNT_SOURCE_CONTAINER_SHARED_DIR: $MOUNT_SOURCE_CONTAINER_SHARED_DIR
echo vnc password admin123
