#!/bin/bash

#This script is for django admin start project
#Its required to inform name of the project as first parameter
#The other 2 parameters has default values as you can see below

#DJANGO PROJECT NAME TO BE CREATED
DJANGO_PROJECT_NAME=$1

# VOLUME_PATH1 is where are your all django projects
VOLUME_PATH_for_django_project_dir=$2;

# PROJECT_NAME is a django specific project folder
VOLUME_PATH_for_scripts=$3;


if [ "X$DJANGO_PROJECT_NAME" = "X" ]; then
    echo "Please, inform name of the project as first parameter"
    exit 1
fi;


IMAGE_NAME="wagnermarques/fzl_django:0.0.1"

if [ "X$VOLUME_PATH" = "X" ] && [ "X$PROJECT_NAME" = "X" ]; then
    PROJECT_NAME="aga";
    # User did not inform volume_path for django project neither project name
    # We will use default aga like the name of this script and my external hd path
    # change it for your django project path
    echo "--- Hey, you do not provide a code for django code volume...";
    echo "--- Using...";
    echo "--- /run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs";
    echo "--- and /run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs/env-dev/sources/dojo-fzl-demos/"
    echo "--- because a symbolic links I use";
    echo "--- !change it to your web app dir!";
    #if you do not provide a /var/www/html volume
    #this will be provide as default
    #change it to your default dir, where there are your web app
    VOLUME_PATH_for_django_project_dir="/run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs/env-dev/pythonprojects/$DJANGO_PROJECT_NAME"
    VOLUME_PATH_for_scripts="/run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs/env-dev/sources/Fedora-Dockerfiles/Django/scripts"
fi;

CONTAINER_NAME="fzl_django-projeto-$PROJECT_NAME";

#if this is the first time the container start
#we are going to use docker run...
#but if dont
#the docker will reclaim the the pre existent container must be removed
#We leave as is because create a new project means a new instance of the container
#for now that is what I'm thinks correct... any sugestions is welcome...
docker run \
       --name $CONTAINER_NAME -d \
       --net=fzl_network_bridge --ip=192.168.33.83 \
       -h $CONTAINER_NAME \
       -v $VOLUME_PATH_for_django_project_dir:/django_project \
       -v $VOLUME_PATH_for_scripts:/scripts \
       -p 8000:8000 \
       $IMAGE_NAME "django-admin-start-project $DJANGO_PROJECT_NAME"


docker logs $CONTAINER_NAME
