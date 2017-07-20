#!/bin/bash

entry_point_params=$1
printf "==>[entrypoint.sh] %s\n" "entry_point_params is $entry_point_params"
PARAM1=$(echo $entry_point_params | cut -d':' -f1) # output is 1
PARAM2=$(echo $entry_point_params | cut -d':' -f2) # output is 2


if [ "$PARAM1" = "bash" ];
then

    echo $PARAM2 | tr '&&' '\n' | while read cmd; do
    $cmd
    done

    #bash_command="$PARAM2"
    #$bash_command
fi



