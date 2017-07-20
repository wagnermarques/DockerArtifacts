#!/bin/bash

IMAGE_NAME=wagnermarques/fzl_nodejs:0.0.0.1;
ContainerIPG="192.168.33.83"
VOLUME_PATH_for_node_projects_dir="/run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs/env-dev/nodeprojects"
#VOLUME_PATH_for_node_projects_dir="/run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs/somewritings/typescript-introduction/examples/"

#parameters with key1:value1;key2:value2 pattern
container_start_parameters=$1


# for node projectname parameters
function start_container_with_single_COMMAND(){
    echo "==> function start_container_with_single_COMMAND(){..."
    command=$1
    echo "==> command:$command"

    #Below we will compose container name with the command
    #Considering that the command can come with spaces, dashes etc because options that cause problems when used for container names
    #So, we are going to change this kind of characteres to underlines
    command_without_spacest=$(echo $command | sed "s/\ /_/g" | sed "s/\//_/g" | sed "s/:/_/g" | sed "s/&&/_/g" | sed "s/\\$/_/g" | sed "s/)/_/g" | sed "s/(/_/g" | sed "s/\./_/g")
    container_name="fzl_node_running_$command_without_spacest"    
    echo "==> container name is $container_name"
    
    docker run \
           --name $container_name -d \
           --net=fzl_network_bridge --ip=$ContainerIPG \
           -h $container_name \
           -v $VOLUME_PATH_for_node_projects_dir:/node_projects \
           -p 8082:8082 \
           $IMAGE_NAME "$command"
    
    docker logs $container_name
}


#This is for non parameters informed to run container
if [ "x$container_start_parameters" = "x" ];
then
    echo "==> You runned ./docker-run.sh withou parameters!";
    echo "==> So, The default behavior in this case is just... " ;
    echo "==> .. and show the /node_projects volume mounted contents..."
    start_container_with_single_COMMAND "bash:ls -l /node_projects"
fi

if [ "$#" -eq 1 ] #command project pattern
then
    start_container_with_single_COMMAND "$container_start_parameters"
fi

