#!/bin/bash
CONTAINER_NAME=pgsql
IMG_NAME=postgres:10.1
docker run \
       --name $CONTAINER_NAME \
       --net fzl_network_bridge --ip 192.168.33.162 \
       -h $CONTAINER_NAME \
       -p 5432:5432 \
       -e POSTGRES_USER=admin \
       -e POSTGRES_PASSWORD=admin123 \
       -d $IMG_NAME \
       
