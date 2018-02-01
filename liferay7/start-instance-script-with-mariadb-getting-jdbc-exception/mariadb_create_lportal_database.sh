#!/bin/bash
#please, checke if there is a mariadb container called "fzl_mariadb-liferay7" up and running...
#this script shoud be running from configure.sh
echo "Running... mariadb_create_lportal_database.sh"

THIS_DIR=$(pwd)
cd ../.. #changin workdir to mariadb-official. Its important to create mariadb data dir in right placek

./mariadb-official/docker-exec-in-a-specific-container.sh $MARIADB_CONTAINER_NAME "create database lportal character set utf8;"
./mariadb-official/docker-exec-in-a-specific-container.sh $MARIADB_CONTAINER_NAME "show databases"

cd $THIS_DIR #returning to original dir, because other script dont be confuse about its workdir
