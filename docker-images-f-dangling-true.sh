#!/bin/bash

#remove all dangling images
#Its interesting to remove them to save disc space
docker images -f dangling=true


