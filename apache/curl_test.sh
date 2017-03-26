#!/bin/bash
ip=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $(docker ps -q))
gateway=$(docker inspect  $(docker ps -q) | grep Gateway)
volumes=$(docker inspect  $(docker ps -q) | grep Volumes)
volumesRW=$(docker inspect  $(docker ps -q) | grep VolumesRW)
echo "curl $ip with gateway $gateway"

curl "$ip"

echo .
echo "showing the www dir"
echo "volumes..."
echo $volumes
echo "volumesRW..."
echo $volumesRW
