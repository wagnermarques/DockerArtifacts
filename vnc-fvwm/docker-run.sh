#!/bin/bash

CONTAINER_NAME=fzl_fvwm_vnc
CONTAINER_HOST_NAME=fzl_fvwm_vnc
CONTAINER_IP=192.168.33.159
CONTAINER_NET=fzl_network_bridge
CONTAINER_BIND_PORT=5901:5901
IMG_NAME=wagnermarques/fzl_fvwm_vnc:0.0.1


docker rm $CONTAINER_NAME

docker run  --name $CONTAINER_NAME -d -p $CONTAINER_BIND_PORT \
       -h $CONTAINER_HOST_NAME --net $CONTAINER_NET --ip $CONTAINER_IP $IMG_NAME   

       docker logs $CONTAINER_NAME       

#vncviewer $CONTAINER_IP:1
       


       

