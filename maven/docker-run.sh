#!/bin/bash

#Pode ser que alguem queira criar mais de um container com nome e ip diferente....
CONTAINER_NAME=$1
CONTAINER_IP=$2
NETWORK_NAME=$3

#Caso nao seja o caso, valores padroes sao atribuidos as variaveis
if [ "x$CONTAINER_NAME" = "x" ]; then
    CONTAINER_NAME="fzl_maven";
fi

if [ "x$CONTAINER_IP" = "x" ]; then
    CONTAINER_IP="192.168.33.150";
fi

if [ "x$NETWORK_NAME" = "x" ];then
    NETWORK_NAME="fzl_network_bridge";
fi



#Esses diretorios sao importantes para o container
#Caso eles nao existam a gente cria 

SHARED_DIR=$(pwd)/../maven_containers_shared_dir/$CONTAINER_NAME
MVN_PROJECTS_DIR=$(pwd)/../../
NEXUS_DATA_DIR="$SHARED_DIR/nexus-data"

if [ ! -d $SHARED_DIR ];
then
    mkdir -p "$SHARED_DIR"
fi

if [ ! -d $MVN_PROJECTS_DIR ];
then
    mkdir -p "$MVN_PROJECTS_DIR"
fi

if [ ! -d $NEXUS_DATA_DIR ];
then
    mkdir -p $NEXUS_DATA_DIR
fi



IMG=wagnermarques/fzl_maven:0.0.1
PORT_MAPPING=8081:8081
docker run  \
       --name $CONTAINER_NAME -d  \
       --net $NETWORK_NAME --ip $CONTAINER_IP   \
       -h $CONTAINER_NAME \
       -p $PORT_MAPPING \
       -v $MVN_PROJECTS_DIR:/mvn_projects \
       -v $NEXUS_DATA_DIR:/nexus-data \
       $IMG
  
