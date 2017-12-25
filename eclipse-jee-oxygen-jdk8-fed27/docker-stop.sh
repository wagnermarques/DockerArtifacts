#!/bin/bash

CONTAINER_NAME=fzl_apache;
VOLUME_PATH=$1;

docker stop  $CONTAINER_NAME 
       
docker logs $CONTAINER_NAME
