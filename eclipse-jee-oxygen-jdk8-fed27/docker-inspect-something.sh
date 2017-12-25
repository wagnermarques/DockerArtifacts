#!/bin/bash

ip=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $(docker ps -q))
echo "container ip = $ip";

gateway=$(docker inspect  $(docker ps -q) | grep Gateway)
echo "container gateway = $gateway";

volumes=$(docker inspect  $(docker ps -q) | grep Volumes)
echo "container volumes = $voumes";

volumesRW=$(docker inspect  $(docker ps -q) | grep VolumesRW)
echo "container volumesRW = $volumesRW";



