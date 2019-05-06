#!/bin/bash

CONTAINER_NAME=fzl_supervisord_httpd_php7;
CONTAINER_IMG="wagnermarques/fzl_supervisord-httpd-php7:0.0.1"
CONTAINER_IP=192.168.33.30

chmod +x $(pwd)/scripts/*

docker run \
       --name $CONTAINER_NAME -d \
       -h $CONTAINER_NAME \
       --net fzl_network_bridge --ip "$CONTAINER_IP" \
       -v "$(pwd)/supervisor_log":/var/log/supervisord \
       -v "$(pwd)/scripts":/scripts \
       -v "$(pwd)/container_config_folder":/etc/supervisord/conf.d/ \
       -v "$(pwd)/www/html":/var/www/html \
       -p 8070:80 "$CONTAINER_IMG"


