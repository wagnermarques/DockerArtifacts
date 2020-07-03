#!/bin/bash

CONTAINER_NAME=fzl_supervisord;

chmod +x $(pwd)/scripts/*

docker run \
       --name $CONTAINER_NAME -d \
       -h $CONTAINER_NAME \
       -v "$(pwd)/supervisor_log":/var/log/supervisord \
       -v "$(pwd)/scripts":/scripts \
       -v "$(pwd)/container_config_folder":/etc/supervisord/conf.d/ \
       wagnermarques/fzl_supervisord:0.0.1


