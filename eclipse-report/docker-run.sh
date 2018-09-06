#!/bin/bash

IMG_NAME=wagnermarques/fzl_eclipse-report:0.0.1;

CONTAINER_NAME=fzl_eclipse_report;
CONTAINER_IP=192.168.33.158

CONTAINER_SHARED_DIR="$(pwd)/../$CONTAINER_NAME"
mkdir -p $CONTAINER_SHARED_DIR

ECLIPSE_WORKSPACE_IN_SHARED_DIR="$CONTAINER_SHARED_DIR/workspace"
mkdir -p "$ECLIPSE_WORKSPACE_IN_SHARED_DIR"

docker run \
       --name $CONTAINER_NAME -d -p 5903:5901 \
       -h fzl_eclipse -v "$ECLIPSE_WORKSPACE_IN_SHARED_DIR":/default_workspace \
       --net fzl_network_bridge --ip $CONTAINER_IP  $IMG_NAME

chmod 777 -R  $ECLIPSE_WORKSPACE_IN_SHARED_DIR #fix this
echo Container name: $CONTAINER_NAME
echo Container ip: $CONTAINER_IP
echo Container ports:  5903:5901
echo Use it: vncviewer $CONTAINER_IP:1
echo -v "$ECLIPSE_WORKSPACE_IN_SHARED_DIR":/default_workspace 
echo vnc password admin123
