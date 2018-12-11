#!/bin/bash

IMG_NAME=wagnermarques/fzl_nodejs:0.0.1

THIS_DIR=$(pwd)
CONTAINER_DATA_DIR=$THIS_DIR/../data-dir-nodejs

#if container data dir non exists, create it
if [ -d $CONTAINER_DATA_DIR ];
then 
    echo "$CONTAINER_DATA_DIR ja existe"
else 
    echo "creating $CONTAINER_DATA_DIR"
    mkdir -p $CONTAINER_DATA_DIR/node_projects
fi


#printer-stats is a 
NODE_PROJECTS_DIR=$CONTAINER_DATA_DIR/node_projects

if [ -d "$NODE_PROJECTS_DIR/nodechat" ];
then
    printf "%s\n" "Project already cloned. To clone it againd just remove project diretory and run this command again"
else
    cd $NODE_PROJECTS_DIR
    git clone https://github.com/wagnermarques/nodechat.git
fi

PROJECT_NAME=nodechat
CONTAINER_NAME=fzl_nodejs_nodechat
CONTAINER_HOST_NAME=$PROJECT_NAME
CONTAINER_IP=192.168.33.34
SHARED_FOLDER=$CONTAINER_DATA_DIR
CONTAINER_RUN_CMD="cd /node_project/node_projects/nodechat && npm install && node index.js"

CONTAINER_PORT=3005

docker run \
       --name "$CONTAINER_NAME" -h "$CONTAINER_HOST_NAME" \
       --net fzl_network_bridge --ip "$CONTAINER_IP" \
       -v "$SHARED_FOLDER":/node_project \
       -p "$CONTAINER_PORT":3000 \
       -d "$IMG_NAME" "bash:$CONTAINER_RUN_CMD"


docker logs $CONTAINER_NAME
