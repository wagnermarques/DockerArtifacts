#!/bin/bash

CONTAINER_NAME=fzl_emacs;

docker rm $CONTAINER_NAME

docker run  \
       --name $CONTAINER_NAME -d  \
       -h $CONTAINER_NAME  \
       wagnermarques/fzl_emacs:0.0.1

docker logs $CONTAINER_NAME

       


       

