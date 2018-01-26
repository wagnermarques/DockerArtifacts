#!/bin/bash
#https://hub.docker.com/_/mariadb/

CONTAINER_NAME=mariadb

mkdir -p $(pwd)/container_shared_folder/$CONTAINER_NAME #data dir is for each respective container name

docker run \
       --name mariadb \
       --net fzl_network_bridge --ip 192.168.33.151 \
       -v $(pwd)/container_shared_folder/$CONTAINER_NAME:/var/lib/mysql \
       -v $(pwd)/sqlscripts:/sqlscripts \
       -h mariadb -p 3306:3306 \
       -e MYSQL_ROOT_PASSWORD=admin123 \
       -d mariadb:10.3 

