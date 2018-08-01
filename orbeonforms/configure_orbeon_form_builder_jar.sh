#!/bin/bash

JAR_DEPLOY_DIR=/home/wagner/wagnerdocri@gmail.com3/fzlbpms/fzlServer/integrated/apache-tomcat-8.5.32/webapps/orbeon/WEB-INF/lib
JAR_CUSTOM_DIR=/home/wagner/wagnerdocri@gmail.com3/envs/env-dev/sources/Fedora-Dockerfiles/orbeonforms/container_config_folder/ipgg/orbeon-form-runner/
JAR_DIR=$(pwd)
JAR_FILE_NAME=orbeon-form-runner-original.jar

#get the jar to be updated
cp $JAR_DEPLOY_DIR/$JAR_FILE_NAME $JAR_DIR

#make a backup
cp $JAR_FILE_NAME "$JAR_FILE_NAME-COPY-$(date).jar"

#the updates
cd $JAR_CUSTOM_DIR
jar uf $JAR_DIR/$JAR_FILE_NAME ./apps/fr/style/logo.jpg

#redeploy jar
cp -f $JAR_DIR/$JAR_FILE_NAME $JAR_DEPLOY_DIR/$JAR_FILE_NAME

