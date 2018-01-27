#!/bin/bash
# this script is for create database for liferay7 in mariadb container
echo "Running... configure_db.sh"

#TODO: Check if there is a container name "fzl_mariadb_liferay7" up and running
#if not, start such container (running this script with user in docker groups)
#source ../../mariadb-official/docker-run.sh fzl_mariadb_liferay7 5306 "192.168.33.165" #3306 already been taken for me now

#if it are running....
echo "... starting liferay container ...."
echo "...LIFERAY_CONTAINER_NAME=$LIFERAY_CONTAINER_NAME"
echo "...LIFERAY_CONTAINER_HOST_PORTS=$LIFERAY_CONTAINER_HOST_PORTS"
echo "...MARIADB_CONTAINER_IP=$MARIADB_CONTAINER_IP"

echo "... starting mariadb container for liferay7 ...."
echo "...MARIADB_CONTAINER_NAME=$MARIADB_CONTAINER_NAME"
echo "...MARIADB_CONTAINER_HOST_PORTS=$MARIADB_CONTAINER_HOST_PORTS"
echo "...MARIADB_CONTAINER_IP=$MARIADB_CONTAINER_IP"

THIS_DIR=$(pwd) 

cd ../../mariadb-official #this is needed because mariadb-official scripts create data directory in right place
source ./docker-run.sh $MARIADB_CONTAINER_NAME $MARIADB_CONTAINER_HOST_PORT $MARIADB_CONTAINER_IP

cd $THIS_DIR #returning to original dir to not confuse another scripts
source mariadb_create_lportal_database.sh
