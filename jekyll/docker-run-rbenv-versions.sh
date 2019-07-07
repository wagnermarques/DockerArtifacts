#!/bin/bash
IMG_NAME=wagnermarques/fzl_jekyll:0.0.1
CMD="rbenv versions"

docker run -d --rm $IMG_NAME "bash;$CMD"
