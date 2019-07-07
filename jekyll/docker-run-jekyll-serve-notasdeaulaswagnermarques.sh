#!/bin/bash

IMG_NAME=wagnermarques/fzl_jekyll:0.0.1
CONTAINER_IP=192.168.33.100

CMD="bundle --version && \
            cd /jekyll-websites/notasdeaulaswagnermarques && \
            bundle --version && \
            bundle install && \
            bundle exec jekyll serve --incremental"

CONTAINER_NAME=jekyll-notasdeaulaswagnermarques

docker stop $CONTAINER_NAME;docker rm $CONTAINER_NAME

docker run -d \
       -v "$(pwd)/jekyll-websites":"/jekyll-websites" \
       --net fzl_network_bridge --ip $CONTAINER_IP \
       --name $CONTAINER_NAME \
       -p 4000:4000 $IMG_NAME "bash;$CMD"
