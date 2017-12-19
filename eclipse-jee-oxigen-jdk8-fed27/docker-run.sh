#!/bin/bash

CONTAINER_NAME=fzl_eclipse_jee_oxygen_java8_fed27;
IMG_NAME=wagnermarques/eclipse-jee-oxigen-jdk8-fed27;

#Change this to provide directory to cotainer create your projects
HOST_DIR_FOR_WORKSPACE="/run/media/wagner/51d54d26-34c8-4671-8da1-c12adc7a5a2c/wagnerdocri@gmail.com2/envs/env-dev/mvnprojects"

docker rm $CONTAINER_NAME

docker run \
       --name $CONTAINER_NAME -d \
       -h fzl_eclipse \
       -v $HOST_DIR_FOR_WORKSPACE:/default_workspace \
        wagnermarques/eclipse-jee-oxigen-jdk8-fed27
       
docker logs $CONTAINER_NAME
