#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

CONTAINER_NAME=fzl_supervisord_httpd_php7;
CONTAINER_IMG="fzlbpms/supervisord-httpd-php:0.0.1";

chmod +x $(pwd)/scripts/*

docker run \
       --name $CONTAINER_NAME -d \
       -h $CONTAINER_NAME \
       -v "$(pwd)/supervisor_log":/var/log/supervisord \
       -v "$(pwd)/scripts":/scripts \
       -v "$(pwd)/container_config_folder":/etc/supervisord/conf.d/ \
       -v "$(pwd)/www/html":/var/www/html \
       -p 8070:80 "$CONTAINER_IMG"


