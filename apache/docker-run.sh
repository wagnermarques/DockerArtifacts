#!/bin/bash

CONTAINER_NAME=fzl_apache;
CONTAINER_IP=192.168.33.105
CONTAINER_SHARED_FOLDER="$(pwd)/../apache-containers-shared-dir/www/html"   

echo "$CONTAINER_SHARED_FOLDER" 
if [ ! -d "$CONTAINER_SHARED_FOLDER" ]; then
    mkdir -p "$CONTAINER_SHARED_FOLDER"
fi 



docker run \
       --name $CONTAINER_NAME -d \
	-h localhost \
       --net fzl_network_bridge --ip "$CONTAINER_IP" \
       -p 9900:80 \
       -v $(pwd)/../apache-containers-shared-dir/www/html:/var/www/html \
       -v $(pwd)/../apache-containers-shared-dir/var/log/apache2:/var/log/apache2 \
	wagnermarques/fzl_apache 
       

echo Container name: $CONTAINER_NAME
echo Container ip: $CONTAINER_IP
echo Container host ports:  9900:80
echo SHARED_FOLDER: $CONTAINER_SHARED_FOLDER
echo http://localhost:$HOST_PORT

