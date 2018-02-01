#!/bin/bash
#please, check if there is a posgresql container called "postgresql_liferay7" up and running...
#this script shoud be running from configure.sh
echo "Running... postgresql_create_lportal_database.sh"

THIS_DIR=$(pwd)
cd ../.. #changin workdir to postgresql-official. Its important to create postgresql data dir in right placek

./postgresql-official/docker-exec-in-a-specific-container.sh $POSTGRESQL_CONTAINER_NAME "CREATE DATABASE lportal"

cd $THIS_DIR #returning to original dir, because other script dont be confuse about its workdir
