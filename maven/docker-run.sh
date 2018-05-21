#!/bin/bash

DATA_DIR=$(pwd)/../data-dir-for-maven
MVN_PROJECTS_DIR=$DATA_DIR/mvnprojects
NEXUS_DATA_DIR=$DATA_DIR/nexus-data

[ -d $DATA_DIR ] || mkdir -p $DATA_DIR
[ -d $MVN_PROJECTS_DIR ] || mkdir -p $MVN_PROJECTS_DIR
[ -d $NEXUS_DATA_DIR ] || mkdir -p $NEXUS_DATA_DIR

PORT_MAPPING=8081:8081
CONTAINER_NAME=fzl_maven;
NETWORK_NAME=fzl_network_bridge
CONTAINER_IP=192.168.33.150
IMG=wagnermarques/fzl_maven:0.0.1
docker run  \
       --name $CONTAINER_NAME -d  \
       --net $NETWORK_NAME --ip $CONTAINER_IP   \
       -h $CONTAINER_NAME \
       -p $PORT_MAPPING \
       -v $MVN_PROJECTS_DIR:/mvn_projects \
       -v $NEXUS_DATA_DIR:/nexus-data \
       $IMG
       
       


       

