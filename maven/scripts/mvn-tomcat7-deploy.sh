#!/bin/bash

MVN_PROJECTS_DIR_IN_CONTAINER=/container_mvn_projects

PROJECT_DIR=$1

cd "$MVN_PROJECTS_DIR_IN_CONTAINER/$PROJECT_DIR"

mvn tomcat7:deploy
