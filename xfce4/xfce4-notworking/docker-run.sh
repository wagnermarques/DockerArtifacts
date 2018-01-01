#!/bin/bash

CONTAINER_NAME=fzl_vnc_xfce4
IMG_NAME=wagnermarques/fzl_vnc_xfce4:0.0.1

#docker rm $CONTAINER_NAME

docker run --name $CONTAINER_NAME --name $CONTAINER_NAME -d \
       -p 5905:5901 -p 9001:9001 --net fzl_network_bridge --ip 192.168.33.159  $IMG_NAME 

#docker logs $CONTAINER_NAME       

#?vncviewer 192.168.33.155:1
       


       

