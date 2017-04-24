#!/bin/bash

#List dangling images
#Its interesting to remove them to save disc space
#docker images -f dangling=true | awk '{print $3}' | xargs docker rmi -f
docker rmi -f $(docker images -f dangling=true -q)


