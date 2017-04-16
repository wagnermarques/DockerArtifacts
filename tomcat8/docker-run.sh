#!/bin/bash

CONTAINER_NAME=fzl_tomcat8

docker rm $CONTAINER_NAME

docker run \
       --name $CONTAINER_NAME -d \
       --net fzl_network_bridge --ip 172.18.0.91 \
       -p 8080:8091 \
        wagnermarques/tomcat8:0.0.1

docker logs $CONTAINER_NAME
