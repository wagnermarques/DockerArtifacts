#!/bin/bash

IMG_NAME=wagnermarques/fzl_postgresql_fed27:0.0.1;

CONTAINER_NAME=fzl2_pgsql;
CONTAINER_IP=192.168.33.162

MOUNT_TARGET_CONTAINER_SHARED_DIR=/container_shared_folder
MOUNT_SOURCE_CONTAINER_SHARED_DIR="$(pwd)"/$CONTAINER_SHARED_FOLDER

POSTGRES_USER=postgres
POSTGRES_PASSWORD=admin123

docker run --name $CONTAINER_NAME2 -h $CONTAINER_NAME -d -p 5432:5432 -e "POSTGRES_USER=$POSTGRES_USER" -e "POSTGRES_PASSWORD=$POSTGRES_PASSWORD" \
       -v $(pwd)/container_shared_folder:/container_shared_folder \
       --mount type=bind,source=$MOUNT_SOURCE_CONTAINER_SHARED_DIR,target=$MOUNT_TARGET_CONTAINER_SHARED_DIR \
       --net fzl_network_bridge --ip $CONTAINER_IP  $IMG_NAME

#; echo $?


#       --restart="unless-stopped" --memory="1024m" --memory-swap="-1" \
       echo " ------------- "
chmod 777 -R $MOUNT_SOURCE_CONTAINER_SHARED_DIR #fix this
echo Container name: $CONTAINER_NAME
echo Container ip: $CONTAINER_IP
echo Container ports: 5432:5432
echo MOUNT_SOURCE_CONTAINER_SHARED_DIR: $MOUNT_SOURCE_CONTAINER_SHARED_DIR
echo To get pgsql prompt, use: ./connect.sh

