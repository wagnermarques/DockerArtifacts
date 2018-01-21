#!/bin/bash
for container_id in $(docker ps -a | tr -s ' ' | cut -f1 -d' '); do docker rm $container_id; done
