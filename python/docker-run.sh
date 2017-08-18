#!/bin/bash

CONTAINER_NAME=fzl_python;
echo "Running $CONTAINER_NAME container based on $CONTAINER_NAME:0.0.1 image";

VOLUME_PATH1=$1;

if [ "X$VOLUME_PATH" = "X" ]; then
    echo "."
    echo "--- Hey, you do not provide a code for django code volume...";
    echo "--- Using...";
    echo "--- /run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs/env-dev/pythonprojects"
    echo "--- !change it to your web app dir!";
    #if you do not provide a /var/www/html volume
    #this will be provide as default
    #change it to your default dir, where there are your web app
    VOLUME_PATH1="/run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs/env-dev/pythonprojects";
fi;


docker rm $CONTAINER_NAME


docker run \
       --net=fzl_network_bridge --ip=192.168.33.82 \
       --name=$CONTAINER_NAME -d \
       -h $CONTAINER_NAME \
       -p 8082:8082 \
       wagnermarques/$CONTAINER_NAME:0.0.1
       #       -v "$VOLUME_PATH1":/code \
       
#docker logs $CONTAINER_NAME
