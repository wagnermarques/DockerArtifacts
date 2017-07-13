#!/bin/bash

for container in $(docker ps -a -q); do docker rm $container; done
