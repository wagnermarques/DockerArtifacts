#!/bin/bash

PYTHON_PROJECTS_DIR="/django_project"
DJANGO_PROJECT_DIR="aga"
CONTAINER_NAME="fzl_django-projeto/aga"
cd "$PYTHON_PROJECTS_DIR/$DJANGO_PROJECT_DIR"
echo $(pwd)
docker exec $CONTAINER_NAME 
#python3 manage.py makemigrations aga
