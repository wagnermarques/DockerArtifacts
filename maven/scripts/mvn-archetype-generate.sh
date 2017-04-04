#!/bin/bash

# In fact, this mvn_projects dir should be a host volume if you would receive the project at
# the host dir provided do be a volume to override this directory
MVN_PROJECTS_DIR_IN_CONTAINER=/opt/container_mvn_projects

chmod -R 777 $MVN_PROJECTS_DIR_IN_CONTAINER
cd $MVN_PROJECTS_DIR_IN_CONTAINER
mvn archetype:generate
