#!/bin/bash
echo "Running... configure_liferay..."
echo "... starting liferay container ...."
echo "...LIFERAY_CONTAINER_NAME=$LIFERAY_CONTAINER_NAME"
echo "...LIFERAY_CONTAINER_HOST_PORTS=$LIFERAY_CONTAINER_HOST_PORTS"
echo "...LIFERAY_CONTAINER_IP=$LIFERAY_CONTAINER_IP"

THIS_DIR=$(pwd)
cd ../ #Enter in docker-run.sh dir to that script handle path correctly

./docker-run.sh $LIFERAY_CONTAINER_NAME $LIFERAY_CONTAINER_HOST_PORTS $LIFERAY_CONTAINER_IP

cd $THIS_DIR #returns to original dir to not confuse calling script
