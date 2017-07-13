#!/bin/bash
#the
#entry_point_params can be more than one parameter
#like, for exemple
#"django-admin-start-project django_project_name"
#so, we need to split to get
#very first one: the command
#very last: command parameter
#in the exemplo, the first param will be a django start project command
#with django_project_name project name
entry_point_params=$1


PARAM1=$(echo $entry_point_params | cut -d':' -f1) # output is 1
PARAM2=$(echo $entry_point_params | cut -d':' -f2) # output is 2

printf "Parametro1:%s\n" $PARAM1
printf "Parametro2:%s\n" $PARAM2

if [ "$PARAM1" = "django-admin-start-project" ]
then
    #if I started container to create a project this is the path
    echo "running: django-admin startproject $PARAM2"
    django-admin startproject $PARAM2
    cd /django_project/
    cd "$PARAM2"
    chmod 777 -R . 
    ls -ilha
    python3 manage.py runserver 0.0.0.0:8000   
else
    echo "$PARAM2"
    cd $PARAM2
    echo $(pwd)
    ls -ilha
    echo "cd \"/django_project/$PARAM2\" && python3 manage.py runserver 0.0.0.0:8000"
    cd "/django_project/$PARAM2" && python3 manage.py runserver 0.0.0.0:8000
fi;


