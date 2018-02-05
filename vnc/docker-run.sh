#!/bin/bash

IMG_NAME=wagnermarques/fzl_vnc:0.0.1

CONTAINER_NAME=fzl_vnc;
CONTAINER_IP=192.168.33.155
CONTAINER_SHARED_FOLDER=container_shared_folder
MOUNT_SOURCE_CONTAINER_SHARED_DIR="$(pwd)"/$CONTAINER_SHARED_FOLDER


docker run  --name $CONTAINER_NAME -d -p 5901:5901 \
       -v $MOUNT_SOURCE_CONTAINER_SHARED_DIR:/$CONTAINER_SHARED_FOLDER \
       -h $CONTAINER_NAME  \
       --net fzl_network_bridge --ip $CONTAINER_IP  $IMG_NAME

chmod 777 -R $MOUNT_SOURCE_CONTAINER_SHARED_DIR #fix this
echo Container name: $CONTAINER_NAME
echo Container ip: $CONTAINER_IP
echo Container ports:  5901:5901
echo Use it: vncviewer $CONTAINER_IP:1
echo MOUNT_SOURCE_CONTAINER_SHARED-DIR: $MOUNT_SOURCE_CONTAINER_SHARED_DIR
echo vnc password admin123

