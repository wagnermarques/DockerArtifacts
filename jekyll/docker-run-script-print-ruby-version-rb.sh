#!/bin/bash
IMG_NAME=wagnermarques/fzl_jekyll:0.0.1
CMD="/scripts/print_ruby_version.rb"
CONTAINER_NAME=fzl_jekyll

chmod +x ./scripts/*

docker run -d --rm \
       -v $(pwd)/scripts:/scripts \
       --name $CONTAINER_NAME \
       -p 4040:80 $IMG_NAME "bash;$CMD"

docker logs $CONTAINER_NAME
