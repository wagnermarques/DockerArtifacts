#!/bin/bash
#https://hub.docker.com/_/mariadb/
docker run \
       --name mariadb \
       --net fzl_network_bridge --ip 192.168.33.151 \
       -h mariadb \
       -p 3306:3306 \
       -e MYSQL_ROOT_PASSWORD=admin123 \
       -d mariadb:10.3 \
       
