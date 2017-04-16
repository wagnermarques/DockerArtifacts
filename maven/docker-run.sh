#!/bin/bash

CONTAINER_NAME=fzl_maven;

#Change this to provide directory to cotainer create your projects
#       -p 2480:2480 \
MVN_PROJECTS_DIR="/run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs/env-dev/mvnprojects"

docker rm $CONTAINER_NAME

docker run  \
       --name fzl_maven -d \
       --net fzl_network_bridge --ip 172.18.0.100 \
       -h fzl_maven \
       -p 8081:8081 -v $MVN_PROJECTS_DIR:/container_mvn_projects \
       wagnermarques/fzl_maven:0.0.1
#      mvn -version
#      /usr/bin/java -version
       
docker logs $CONTAINER_NAME
