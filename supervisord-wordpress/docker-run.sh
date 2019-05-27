#!/bin/bash

CONTAINER_NAME=fzl_wordpress;
IMG_NAME=wagnermarques/fzl_supervisord_wordpress:0.0.1
CONTAINER_IP=192.168.33.55

chmod +x $(pwd)/scripts/*

docker run \
       --name $CONTAINER_NAME -d \
       -h $CONTAINER_NAME \
       --net fzl_network_bridge --ip "$CONTAINER_IP" \
       -p 8071:80 \
       -v "$(pwd)/supervisor_log":/var/log/supervisord \
       -v "$(pwd)/scripts":/scripts \
       -v "$(pwd)/container_config_folder":/etc/supervisord/conf.d/ \
       -v "$(pwd)/www/html":/var/www/html \
       $IMG_NAME


