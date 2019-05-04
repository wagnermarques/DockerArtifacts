#!/bin/bash

CONTAINER_NAME=fzl_supervisord;
CONTAINER_IP=192.168.33.20

chmod +x $(pwd)/scripts/*

docker run \
       --name $CONTAINER_NAME -d \
       -h $CONTAINER_NAME \
       --net fzl_network_bridge --ip "$CONTAINER_IP" \
       -v "$(pwd)/supervisor_log":/var/log/supervisord \
       -v "$(pwd)/scripts":/scripts \
       -v "$(pwd)/container_config_folder":/etc/supervisord/conf.d/ \
       wagnermarques/fzl_supervisord:0.0.1


