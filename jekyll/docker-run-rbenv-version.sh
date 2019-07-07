#!/bin/bash
IMG_NAME=wagnermarques/fzl_jekyll:0.0.1
CMD="rbenv version"

docker run -d --rm $IMG_NAME "bash;$CMD"

