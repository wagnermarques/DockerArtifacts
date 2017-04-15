#!/bin/bash

APP_NAME=$1

if [ "X$APP_NAME" == "X" ];
then {
        echo "Please provide app name as first parameter"
        exit 1
}
fi

dojo create --name $APP_NAME
