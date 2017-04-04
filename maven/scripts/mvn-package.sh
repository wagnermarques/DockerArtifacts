#!/bin/bash

# In fact, this mvn_projects dir should be a host volume if you would receive the project at
# the host dir provided do be a volume to override this directory
MVN_PROJECTS_DIR_IN_CONTAINER=/opt/container_mvn_projects

PROJECT_DIR=$1

cd $MVN_PROJECTS_DIR_IN_CONTAINER/$1

mvn package
