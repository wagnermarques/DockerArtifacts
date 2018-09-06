#!/bin/bash

CONTAINER_NAME=fzlbpms 
HOST_TOMCAT_PORT=8062
HOST_KARAF_PORT=9111
CONTAINER_IP=192.168.33.161

SHARED_FOLDER="$(pwd)/$CONTAINER_NAME"

IMG_NAME=wagnermarques/fzlbpms:0.0.1

docker run \
       --name "$CONTAINER_NAME" -h "$CONTAINER_HOST_NAME" \
       --net fzl_network_bridge --ip "$CONTAINER_IP" \
       -v "$SHARED_FOLDER":/shared-dir \
       -p "$HOST_TOMCAT_PORT":8080 -p "$HOST_KARAF_PORT":8101 \
       -d "$IMG_NAME" 
       
echo Container name: $CONTAINER_NAME
echo Container ip: $CONTAINER_IP
echo Container host ports:  $HOST_PORT
echo SHARED_FOLDER: $SHARED_FOLDER
echo http://localhost:$HOST_TOMCAT_PORT
echo http://localhost:$HOST_KARAF_PORT



