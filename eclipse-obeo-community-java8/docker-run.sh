#!/bin/bash

CONTAINER_NAME=fzl_eclipse;

#Change this to provide directory to cotainer create your projects
HOST_DIR_FOR_WORKSPACE="/run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs/env-dev/mvnprojects"

docker rm $CONTAINER_NAME

docker run \
       --name $CONTAINER_NAME -d \
       -h fzl_eclipse \
       -v $HOST_DIR_FOR_WORKSPACE:/default_workspace
       wagnermarques/fzl_eclipse 
       
docker logs $CONTAINER_NAME
