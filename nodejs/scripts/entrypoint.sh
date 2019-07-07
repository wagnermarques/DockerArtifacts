#!/bin/bash

entry_point_params=$1
printf "==>[entrypoint.sh] %s\n" "entry_point_param is $entry_point_params"
PARAM1=$(echo $entry_point_params | cut -d':' -f1) # output is 1
PARAM2=$(echo $entry_point_params | cut -d':' -f2) # output is 2
PARAM3=$(echo $entry_point_params | cut -d':' -f3) # output is 3
printf "==>[entrypoint.sh] %s\n" "PARAM1=$PARAM1"
printf "==>[entrypoint.sh] %s\n" "PARAM2=$PARAM2"
printf "==>[entrypoint.sh] %s\n" "PARAM3=$PARAM3"

if [ "$PARAM1" = "bash" ];
then
    printf "==>[entrypoint.sh] %s\n" "about to running $PARAM2 command"

    echo $PARAM2 | tr '&&' '\n' | while read cmd; do
        $cmd
    done
    
fi



