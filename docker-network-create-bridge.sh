#!/bin/bash

NETWORK_BRIDGE_NAME=$1

if [ "X$NETWORK_BRIDGE_NAME" == "X" ];
then {
    echo "Please provide a network bridge name as a paramenter";
    exit 1;
}
fi
     
docker network create -d bridge "$NETWORK_BRIDGE_NAME"
