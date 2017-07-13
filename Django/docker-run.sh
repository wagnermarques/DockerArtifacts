#!/bin/bash

param1=$1;
fzl_django_container_name="fzl_django_$1"
container_run_command=$2

IMAGE_NAME="wagnermarques/fzl_django:0.0.1"
VOLUME_PATH_for_django_project_dir="/run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs/env-dev/pythonprojects/"
VOLUME_PATH_for_scripts="/run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs/env-dev/sources/Fedora-Dockerfiles/Django/scripts"


function usage(){
    printf "%s\n" "usage..."
    printf "%s\n" "./docker-run.sh yourprojectname, or"
    printf "%s\n" "./docker-run.sh yourprojectname django-admin-start-project (To create a django project)"
    exit 1
}

if [ "X$1" = "X" -a "X$2" = "X" ]
then
    usage
fi;


docker run \
       --name "$fzl_django_container_name" -d \
       --net=fzl_network_bridge --ip=192.168.33.83 \
       -h $fzl_django_container_name \
       -v $VOLUME_PATH_for_django_project_dir:/django_project \
       -v $VOLUME_PATH_for_scripts:/scripts \
       -p 8000:8000 \
       $IMAGE_NAME "$container_run_command:$param1"

docker logs $fzl_django_container_name
