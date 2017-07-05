#!/bin/bash

CONTAINER_NAME=fzl_tomcat7.0.56


#docker rm $CONTAINER_NAME

docker run --name $CONTAINER_NAME -d \
       --net fzl_network_bridge --ip 172.18.0.192 \
       -h $CONTAINER_NAME -p 8092:8080  wagnermarques/$$CONTAINER_NAME:0.0.1

        docker logs $CONTAINER_NAME

        #       --net fzl_network_bridge

        #       --ip 172.17.0.91 \

