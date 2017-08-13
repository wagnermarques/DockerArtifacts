#!/bin/bash

CONTAINER_NAME=fzl_maven;
VOLUME_PATH=$1;

docker stop  $CONTAINER_NAME 
       
docker logs $CONTAINER_NAME
