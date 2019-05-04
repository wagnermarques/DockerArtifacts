#!/bin/bash

FZL_SHARED_FOLDER="/home/wagner/wagnerdocri@gmail.com3/fzlbpms/fzlbpms_shared/docker/maven/"
NEXUS_DATA_DIR="$SHARED_FOLDER/nexus/nexus-data"
MVN_PROJECTS_DIR="/home/wagner/wagnerdocri@gmail.com3/envs/env-dev/sources/"

[ -d $FZL_SHARED_FOLDER ] || mkdir -p $FZL_SHARED_FOLDER
[ -d $NEXUS_DATA_DIR ] || mkdir -p $NEXUS_DATA_DIR


CONTAINER_SCRIPTS=$(pwd)/scripts
chmod +x -R $(pwd)/scripts/*.sh


CONTAINER_NAME=fzl_maven
CONTAINER_IP=192.168.33.150
NETWORK_NAME=fzl_network_bridge
IMG=wagnermarques/fzl_maven:0.0.1
PORT_MAPPING=8081:8081

docker run  \
       --name $CONTAINER_NAME -d  \
       --net $NETWORK_NAME --ip $CONTAINER_IP   \
       -h $CONTAINER_NAME \
       -p $PORT_MAPPING \
       -v $MVN_PROJECTS_DIR:/mvn_projects \
       -v $NEXUS_DATA_DIR:/nexus-data \
       -v $CONTAINER_SCRIPTS:/scripts \
       $IMG

echo ">>> Running maven container with this configuration below..."
echo ">>> --name $CONTAINER_NAME"
echo ">>> -p $PORT_MAPPING"
echo ">>> -v $NEXUS_DATA_DIR:/nexus-data "
