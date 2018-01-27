#!/bin/bash
CONTAINER_NAME=sqlserver
docker attach $CONTAINER_NAME

echo "You can dis attach with: ctrl-p ctrl-q"
