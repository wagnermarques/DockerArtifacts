#!/bin/bash

entry_point_params=$1
printf "==>[entrypoint.sh] %s\n" "entry_point_params is $entry_point_params"
PARAM1=$(echo $entry_point_params | cut -d':' -f1) # output is 1
PARAM2=$(echo $entry_point_params | cut -d':' -f2) # output is 2


if [ "$PARAM1" = "bash" ];
then
    printf "==>[entrypoint.sh] %s\n" "about to running $PARAM2 command"
    printf "==>[entrypoint.sh] %s\n" "ls /"
    ls -la /
    printf "==>[entrypoint.sh] %s\n" "ls /node_project"
    ls -la /node_project
    
    cd /node_project    
    echo $PARAM2 | tr '&&' '\n' | while read cmd; do
    $cmd
    done

fi



