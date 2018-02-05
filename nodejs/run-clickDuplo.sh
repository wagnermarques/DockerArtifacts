#!/bin/bash

THIS_DIR=$(pwd)

cd $THIS_DIR/../nodejs-containers-shared-dir

git clone https://github.com/Rjcf/ClickDuplo.git
cd ClickDuplo/jogo-clickduplo

PROJECT_SRC_FOLDER=$(pwd)
cd $THIS_DIR

PROJECT_NAME=ClickDuplo
RUNCOMMAND="cd /node_project/jogo-clickduplo && npm install && npm start"
IP=192.168.33.32
HOST_PORT=3002
./docker-run.sh "projectname:$PROJECT_NAME;project_source_folder:$PROJECT_SRC_FOLDER;runcommand:$RUNCOMMAND;ip:$IP;host_port:$HOST_PORT"
