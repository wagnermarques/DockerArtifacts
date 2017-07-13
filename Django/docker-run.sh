#!/bin/bash

param1=$1;
param2=$2;

IMAGE_NAME="wagnermarques/fzl_django:0.0.1"
VOLUME_PATH_for_django_project_dir="/run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs/env-dev/pythonprojects/"
VOLUME_PATH_for_scripts="/run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs/env-dev/sources/Fedora-Dockerfiles/Django/scripts"


function usage(){
    printf "%s\n" "usage..."
    printf "%s\n" "./docker-run.sh yourprojectname, or"
    printf "%s\n" "./docker-run.sh yourprojectname django-admin-start-project (To create a django project)"
}


function start_container_with_command_and_project_name(){
    starting_command=$1
    container_name="fzl_django_$2"
    project_name=$2

    echo "starting_command=$starting_command"
    echo "container_name=$container_name"
    echo "project_name=$project_name"

    docker run \
           --name $container_name -d \
           --net=fzl_network_bridge --ip=192.168.33.83 \
           -h $container_name \
           -v $VOLUME_PATH_for_django_project_dir:/django_project \
           -v $VOLUME_PATH_for_scripts:/scripts \
           -p 8000:8000 \
           $IMAGE_NAME "$starting_command:$project_name"
    
    docker logs $container_name
    
}

function start_container_just_whith_project_name(){
    container_name="fzl_django_$1"
    project_name=$1

    echo "container_name=$container_name"
    echo "project_name=$project_name"

    docker run \
       --name $container_name -d \
       --net=fzl_network_bridge --ip=192.168.33.83 \
       -h $container_name \
       -v $VOLUME_PATH_for_django_project_dir:/django_project \
       -v $VOLUME_PATH_for_scripts:/scripts \
       -p 8000:8000 \
       $IMAGE_NAME ":$project_name"

    docker logs $container_name
}

#without parameter
if [ "X$1" = "X" -a "X$2" = "X" ]
then
    usage
    exit 1
fi;

#more then two parameters
if [ "$#" -gt 2 ]
then
    usage
    exit 1
fi;

#if there is just one parameter, this parameters is for django project
#otherwise, if thereis two parameter, the first one is command to start container and the second if for project name
if [ "$#" -eq 1 ]   
then
    project_name=$param1;
    start_container_just_whith_project_name $project_name
fi;

if [ "$#" -eq 2 ]
then
    echo "Dois parametro"
    starting_command=$param1
    project_name=$param2;
    start_container_with_command_and_project_name $starting_command $project_name
fi;


