#!/bin/bash

CONTAINER_NAME=fzl_maven;

#Change this to provide directory to cotainer create your projects
MVN_PROJECTS_DIR="/run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs/env-dev/mvnprojects"

docker rm $CONTAINER_NAME

docker run \
       --name $CONTAINER_NAME -d \
       -h fzl_maven \
       -p 8081:8081 \
       -v $MVN_PROJECTS_DIR:/opt/container_mvn_projects \
       wagnermarques/fzl_maven 
#       /usr/bin/java -version
       
docker logs $CONTAINER_NAME
