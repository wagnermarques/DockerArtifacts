#!/bin/bash

IMG_NAME=wagnermarques/fzl_jekyll:0.0.1
CONTAINER_IP=192.168.33.101

CMD="bundle --version && \
            cd /jekyll-websites/bootstrap-4-github-pages && \
            bundle --version && \
            bundle install && \
            bundle exec jekyll serve"

CMD2="cd /jekyll-websites/bootstrap-4-github-pages && \ 
                        ls && \
                        gem install jekyll-feed && \
                        bundler -v ; jekyll -v && \ 
                        bundle install && \ 
                        bundle exec jekyll serve --incremental"

CONTAINER_NAME=jekyll-bootstrap-4-github-pages

docker rm $CONTAINER_NAME

docker run -d \
       -v "$(pwd)/jekyll-websites":"/jekyll-websites" \
       --net fzl_network_bridge --ip $CONTAINER_IP \
       --name $CONTAINER_NAME \
       -p 4001:4001 $IMG_NAME "bash;$CMD"
