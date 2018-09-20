#!/bin/bash

CONTAINER_NAME=fzl_apache;
CONTAINER_IP=192.168.33.100
CONTAINER_SHARED_FOLDER="$(pwd)/../apache-containers-shared-dir/www/html"   

mkdir -p "$CONTAINER_SHARED_FOLDER"

docker run \
       --name $CONTAINER_NAME -d \
       -h $CONTAINER_NAME \
       --net fzl_network_bridge --ip "$CONTAINER_IP" \
       -p 18080:80 \
       -v $(pwd)/../apache-containers-shared-dir/www/html:/var/www/html \
       wagnermarques/fzl_apache 
       

echo Container name: $CONTAINER_NAME
echo Container ip: $CONTAINER_IP
echo Container host ports:  $HOST_PORT
echo SHARED_FOLDER: $SHARED_FOLDER
echo http://localhost:$HOST_PORT


