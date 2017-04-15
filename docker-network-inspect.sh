#!/bin/bash

NETWORK_NAME=$1;

if [ "X$NETWORK_NAME" == "X" ];
then {
    echo "Please provide a network name to be inspected";
    echo "To see docker netowks available: docker network ls";
    exit 1;
}
fi;

docker network inspect "$NETWORK_NAME"
