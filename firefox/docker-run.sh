#!/bin/bash

CONTAINER_NAME=fzl_firefox;

docker rm $CONTAINER_NAME

docker run  --name $CONTAINER_NAME -d -p 5902:5901 \
       -h $CONTAINER_NAME  \
       --net fzl_network_bridge --ip 192.168.33.157   wagnermarques/fzl_firefox:0.0.1

       docker logs $CONTAINER_NAME       

vncviewer 192.168.33.157:1
       


       

