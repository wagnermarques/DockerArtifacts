#!/bin/bash
echo "Running... new-instance-properties"
#When run new instance of liferay we want to get a container for liferay and its respective mariadb database container
#The containers needs its names, its ports and its ips to run withou conflict wih enviroment
#This script define such properties...
#Its betters collect this data in a file than receive as script parameters because are many of them

LIFERAY_CONTAINER_NAME=fzl_liferay7
LIFERAY_CONTAINER_IP=192.168.33.160
LIFERAY_CONTAINER_HOST_PORTS=8060

MARIADB_CONTAINER_NAME=fzl_mariadb_liferay7
MARIADB_CONTAINER_IP=192.168.33.165
MARIADB_CONTAINER_HOST_PORT=4306
