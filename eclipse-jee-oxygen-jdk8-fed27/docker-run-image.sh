#!/bin/bash

CONTAINER_NAME=wagnermarques/fzl_maven;

docker run -i $CONTAINER_NAME /usr/bin/mvn -v

docker logs $CONTAINER_NAME
