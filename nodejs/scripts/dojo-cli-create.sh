#!/bin/bash

CONTAINER_NODEJS_PROJECTS_DIR="/container_projects_dir";
APP_NAME=$1

if [ "X$APP_NAME" == "X" ];
   then {            
        echo "Please provide app name as first parameter"
        exit 1
   }
fi

cd "$CONTAINER_NODEJS_PROJECTS_DIR";

dojo create --name $APP_NAME
