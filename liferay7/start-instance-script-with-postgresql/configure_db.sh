#!/bin/bash
# this script is for create database for liferay7 in mariadb container
echo "Running... configure_db.sh"

#TODO: Check if there is a container name "fzl_postgresql_liferay7" up and running
#if not, start such container (running this script with user in docker groups)
#source ../../postgresql-official/docker-run.sh postgresql_liferay7 5432 "192.168.33.162" #3306 already been taken for me now

#if it are running....
echo "... starting liferay container ...."
echo "...LIFERAY_CONTAINER_NAME=$LIFERAY_CONTAINER_NAME"
echo "...LIFERAY_CONTAINER_HOST_PORTS=$LIFERAY_CONTAINER_HOST_PORTS"
echo "...POSTGRESQL_CONTAINER_IP=$POSTGRESQL_CONTAINER_IP"

echo "...starting mariadb container for liferay7 .."
echo "...POSTGRESQL_CONTAINER_NAME=$POSTGRESQL_CONTAINER_NAME"
echo "...POSTGRESQL_CONTAINER_HOST_PORTS=$POSTGRESQL_CONTAINER_HOST_PORTS"
echo "...POSTGRESQL_CONTAINER_IP=$POSTGRESQL_CONTAINER_IP"

THIS_DIR=$(pwd) 

cd ../../postgresql-official #this is needed because mariadb-official scripts create data directory in right place
source ./docker-run.sh $POSTGRESQL_CONTAINER_NAME $POSTGRESQL_CONTAINER_HOST_PORTS $POSTGRESQL_CONTAINER_IP

cd $THIS_DIR #returning to original dir to not confuse another scripts
source postgresql_create_lportal_database.sh
