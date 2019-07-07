#!/bin/bash

WEBSITENAME=$1

if [ -z "$WEBSITENAME" ];
then
    echo "please provide websitename as first parameter"
    exit 1;
else
    echo "the WEBSITENAME is $WEBSITENAME"
fi;

    
IMG_NAME=wagnermarques/jekyll:0.0.1
CMD="cd /jekyll-websites && pwd  && jekyll new $WEBSITENAME && cd $WEBSITENAME && pwd && bundle exec jekyll"
CONTAINER_NAME=jekyll

docker rm $CONTAINER_NAME

docker run -d \
       -v "$(pwd)/jekyll-websites":"/jekyll-websites" \
       --name $CONTAINER_NAME \
       -p 4040:80 $IMG_NAME "bash:$CMD"
