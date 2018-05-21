#!/bin/bash

CONTAINER_NAME=fzl_tomcat8

docker rm $CONTAINER_NAME

docker run \
       --name $CONTAINER_NAME -d \
       --net fzl_network_bridge --ip 192.168.33.91 \
       -h fzl_tomcat8 -p 80:8080  wagnermarques/tomcat8:0.0.1

        docker logs $CONTAINER_NAME

        #       --net fzl_network_bridge

        #       --ip 172.17.0.91 \

