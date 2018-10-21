#!/bin/bash

PROJECT_DIR_NAME=$1
cd "/mvn_projects/$PROJECT_DIR_NAME" && mvn install

