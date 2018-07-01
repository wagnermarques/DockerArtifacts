#!/bin/bash

CMD=$1
IMAGE_NAME=wagnermarques/dotnetcore:0.0.1
CONTAINER_NAME=dotnetcore;

docker run $IMAGE_NAME $CMD

docker logs $CONTAINER_NAME       



       

