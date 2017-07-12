#!/bin/bash

NETWORK_BRIDGE_NAME=$1

if [ "X$NETWORK_BRIDGE_NAME" == "X" ];
then {
    echo "."
    echo "You have not provide docker network bridge name... ";
    echo "As default we are going to user \"fzl_network_bridge\""; 
    NETWORK_BRIDGE_NAME="fzl_network_bridge"
}
fi
     
docker network create \
       --driver bridge \
       --subnet=192.168.33.0/24 \
       --gateway=192.168.33.10 \
       --opt "com.docker.network.bridge.name"="FzlDckrBr" \
       "$NETWORK_BRIDGE_NAME"

# -d or --driver flag tells Docker to use the bridge driver for the new network.
docker network ls
echo "Launch a container and pass --net=your_network_bridge_name flag to connect it to your new network:"
