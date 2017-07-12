#!/bin/bash

CONTAINER_NAME=fzl_maven;

#Change this to provide directory to cotainer create your projects
#       -p 2480:2480 \
MVN_PROJECTS_DIR="/run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs/env-dev/mvnprojects";
NEXUS_DATA_DIR="/run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs/env-dev/sources/Fedora-Dockerfiles/maven/nexus-data";

#this is a workarount about the error message
# You have to remove (or rename) that container to be able to reuse that name..
# when serveral issuea of this run command for the this container
docker rm $CONTAINER_NAME


docker run  \
       --name fzl_maven -d  \
       --net fzl_network_bridge --ip 192.168.33.150  \
       --link fzl_tomcat8:fzl_tomcat8 \
       -h fzl_maven  \
       -p 8081:8081  \
       -v $MVN_PROJECTS_DIR:/container_mvn_projects \
       -v $NEXUS_DATA_DIR:/nexus-data \
       wagnermarques/fzl_maven:0.0.1


       docker logs $CONTAINER_NAME
       
       #-v $NEXUS_DATA_DIR:/opt/sonatype-work \
       #      mvn -version
       #      /usr/bin/java -version
       
       


       

