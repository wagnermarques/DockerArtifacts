#!/bin/bash

CONTAINER_NAME=fzl_mariadb;

DATA_DIR=/run/media/wagner/51d54d26-34c8-4671-8da1-c12adc7a5a2c/wagnerdocri@gmail.com2/fzlbpms/fzlServer/data/data-mariadb/
LOG_DIR=/run/media/wagner/51d54d26-34c8-4671-8da1-c12adc7a5a2c/wagnerdocri@gmail.com2/fzlbpms/fzlServer/log/log-mariadb/

#docker rm fzl_mariadb

#FIXME
chmod 777 -R  $DATA_DIR
chmod 777 -R  $LOG_DIR

docker run  \
       --name fzl_mariadb -d  \
       --net fzl_network_bridge --ip 192.168.33.151  \
       -h fzl_mariadb  \
       -v $DATA_DIR:/var/lib/mysql \
       -v $LOG_DIR:/var/log/mysql \
       -p 3306:3306  \
       wagnermarques/fzl_mariadb:0.0.1

       docker logs $CONTAINER_NAME
       
       #-v $NEXUS_DATA_DIR:/opt/sonatype-work \
       #      mvn -version
       #      /usr/bin/java -version
       
       


       

