#!/bin/bash

THIS_DIR=$(pwd)

cd $THIS_DIR/../nodejs-containers-shared-dir
git clone https://github.com/wagnermarques/nodegmap.git
cd nodegmap
PROJECT_SRC_FOLDER=$(pwd)
ls -l
cd $THIS_DIR
./docker-run.sh "projectname:nodegmap;project_source_folder:$PROJECT_SRC_FOLDER;runcommand:cd /node_project/nodegmap/ && npm install && npm start;ip:192.168.33.31;host_port:3001"
