#!/bin/bash

CONTAINER_NAME=fzl_liferay7

docker rm $CONTAINER_NAME

docker run \
       --name $CONTAINER_NAME -d \
       --net fzl_network_bridge --ip 172.18.0.80  \
       -p 8080:8080 \
       wagnermarques/liferay:0.0.1

docker logs $CONTAINER_NAME
