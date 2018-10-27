#!/bin/bash

IMG_NAME=wagnermarques/fzl_nodejs:0.0.1

THIS_DIR=$(pwd)
CONTAINER_DATA_DIR=$THIS_DIR/../data-dir-nodejs/


if [ -d $CONTAINER_DATA_DIR ];
then 
    echo "$CONTAINER_DATA_DIR ja existe"
else 
    echo "creating $CONTAINER_DATA_DIR"
    mkdir -p $CONTAINER_DATA_DIR/node_projects
fi


SRC_DIR=$CONTAINER_DATA_DIR/fzl_nodejs_nodegmap

if [ -d $SRC_DIR ];
then
    printf "%s\n" "Project already cloned. To clone it againd just remove project diretory and run this command again"
else
    cd $CONTAINER_DATA_DIR/node_projects
    git clone https://github.com/wagnermarques/nodegmap.git
fi


PROJECT_NAME=nodegmap
CONTAINER_NAME=$PROJECT_NAME
CONTAINER_HOST_NAME=$PROJECT_NAME
CONTAINER_IP=192.168.33.30
CONTAINER_RUN_CMD="cd /node_project/node_projects/$PROJECT_NAME && npm install && npm start"

CONTAINER_PORT=3001

docker run \
       --name "$CONTAINER_NAME" -h "$CONTAINER_HOST_NAME" \
       --net fzl_network_bridge --ip "$CONTAINER_IP" \
       -v $CONTAINER_DATA_DIR:/node_project \
       -p "$CONTAINER_PORT":3000 \
       -d "$IMG_NAME" "bash:$CONTAINER_RUN_CMD"


docker logs $CONTAINER_NAME





