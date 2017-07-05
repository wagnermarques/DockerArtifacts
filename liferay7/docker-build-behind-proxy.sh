#!/bin/bash

USER=$1
PASSWD=$2
HOST=$3
PORT=$4

docker build \
       --build-arg HTTP_PROXY=http://$USER:$PASSWD:$HOST:$PORT \
       -t wagnermarques/liferay:0.0.1 .
