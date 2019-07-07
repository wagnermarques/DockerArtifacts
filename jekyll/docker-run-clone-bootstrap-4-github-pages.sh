#!/bin/bash


THEME_PROJECT_GIT_URL=https://github.com/wagnermarques/bootstrap-4-github-pages.git

IMG_NAME=wagnermarques/jekyll:0.0.1
CMD="cd /jekyll-websites && git clone $THEME_PROJECT_GIT_URL"
CONTAINER_NAME=jekyll

docker rm $CONTAINER_NAME

docker run -d \
       -v "$(pwd)/jekyll-websites":"/jekyll-websites" \
       --name $CONTAINER_NAME \
       -p 4040:80 $IMG_NAME "bash;$CMD"
