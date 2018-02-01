#!/bin/bash

#THIS IS A KEY1:VALUE1;KEY2:VALUE2 patern
#use parameters with key1:value1;key2:value2 pattern
CONTAINER_RUN_PARAMS=$1;

IMG_NAME=wagnermarques/fzl_nodejs:0.0.1

if [ "$#" -eq 0 ] #./handler ./docker-run without commad parameter
then
    printf "==>[docker-run.sh] %s\n" "Please use docker runner parameters like"
    printf "==>[docker-run.sh] %s\n" "./docker-run.sh projectname:projeto1;runcommand:node index.js;ip:192.168.33.30;host_port:3000"
    printf "==>[docker-run.sh] %s\n" "this will seek for projeto1 folder in SHARED_FOLDER=$SHARED_FOLDER"
    printf "==>[docker-run.sh] %s\n" "and run command node index.js to start the project"
    printf "==>[docker-run.sh] %s\n" "the container name will be fzl_node_projeto1"
    printf "==>[docker-run.sh] %s\n" "the container will use ip 192.168.33.30. Please, the network address is 192.168.33.0/24"
    printf "==>[docker-run.sh] %s\n" "the container will use host port 3000"
    exit 1
fi

#https://stackoverflow.com/questions/10586153/split-string-into-an-array-in-bash
if [ "$#" -eq 1 ] #handle ./docker-run.sh with a command parameter 
then
    
    echo "Running with CONTAINER_RUN_PARAMS=$CONTAINER_RUN_PARAMS"
    IFS=';' read -r -a array <<< "$CONTAINER_RUN_PARAMS"
    for PARAM in "${array[@]}"
    do        
        echo "Trando parametro: $PARAM"
        IFS=':' read -r -a KeyValue <<< "$PARAM"        
        key=${KeyValue[0]}
        val=${KeyValue[1]}
        
        if [ $key = "projectname" ]
        then
            PROJECT_NAME=$val
            CONTAINER_NAME=fzl_nodejs_$PROJECT_NAME
            #may be needed...
            #command_without_spacest=$(echo $command | sed "s/\ /_/g" | sed "s/\//_/g" | sed "s/:/_/g" | sed "s/&&/_/g" | sed "s/\\$/_/g" | sed "s/)/_/g" | sed "s/(/_/g" | sed "s/\./_/g")
            #container_name="fzl_node_running_$command_without_spacest"    
        fi

        if [ $key = "runcommand" ]
        then
            RUN_COMMAND=$val
        fi

        if [ $key = "ip" ]
        then
            CONTAINER_IP=$val
        fi

        if [ $key = "host_port" ]
        then
            HOST_PORT=$val
        fi

        if [ $key = "project_source_folder" ]
        then
            PROJECT_SRC_FOLDER=$val
        fi

    done

    printf "[docker-run.sh] %s\n" "Variaveis utilizadas para rodar o container..."

    echo "PROJECT_SRC_FOLDER=$PROJECT_SRC_FOLDER"
    echo "PROJECT_NAME=$PROJECT_NAME";
    echo "CONTAINER_NAME=$CONTAINER_NAME"
    echo "RUN_COMMAND=$RUN_COMMAND";
    echo "CONTAINER_IP=$CONTAINER_IP"
    echo "HOST_PORT=$HOST_PORT"
    mkdir -p $(pwd)/../nodejs-containers-shared-dir/$CONTAINER_NAME 
    SHARED_FOLDER=$(pwd)/../nodejs-containers-shared-dir/$CONTAINER_NAME
    cp -r $PROJECT_SRC_FOLDER $SHARED_FOLDER
    echo "SHARED_FOLDER=$SHARED_FOLDER"
    echo "ls -l SHARED_FOLDER"
    ls -l $SHARED_FOLDER

fi

echo "Running... fzl_nodejs/docker-run.sh <$CONTAINER_NAME> at host port <$HOST_PORT> and ip <$CONTAINER_IP>."
docker run \
       --name "$CONTAINER_NAME" -h "$CONTAINER_HOST_NAME" \
       --net fzl_network_bridge --ip "$CONTAINER_IP" \
       -v "$SHARED_FOLDER":/node_project \
       -p "$HOST_PORT":3000 \
       -d "$IMG_NAME" "bash:$RUN_COMMAND"
       

#echo SHARED_FOLDER: $SHARED_FOLDER
#echo http://localhost:$HOST_PORT
