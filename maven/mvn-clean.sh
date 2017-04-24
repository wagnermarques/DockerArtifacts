#!/bin/bash

#MVN_PROJECTS_DIR=/run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs/env-dev/mvnprojects
PROJECT=$1
docker exec -it fzl_maven  /scripts/mvn-clean.sh $PROJECT
