#!/bin/bash

CONTAINER_NAME=fzl_android
HOST_PORT_MAPPING=5901:5901
CONTAINER_IP=192.168.33.155
IMG_NAME=wagnermarques/fzl_android-java-oracle-8-fed27-vnc:0.0.1;
echo "Running... docker-run.sh <$CONTAINER_NAME> at host port <$HOST_PORT> and ip <$CONTAINER_IP>."


mkdir -p $(pwd)/../android-java-oracle-8-fed27-shared-dir/$CONTAINER_NAME #data dir is for each respective container name
DATADIR=$(pwd)/../android-java-oracle-8-fed27-shared-dir/$CONTAINER_NAME

docker run \
       --name  $CONTAINER_NAME -h $CONTAINER_NAME  -d -p $HOST_PORT_MAPPING \
       --net fzl_network_bridge --ip $CONTAINER_IP  \
       -v $DATADIR:/default_workspace \
       -v $(pwd)/scripts:/scripts \
       $IMG_NAME

docker logs $CONTAINER_NAME



