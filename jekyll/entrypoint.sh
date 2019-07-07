#!/bin/sh

entrypoint_params=$1
printf "==>[entrypoint.sh] %s\n" "entry_point_param is $entrypoint_params"

PARAM1=$(echo $entrypoint_params | cut -d';' -f1) # output is 1 must be 'bash' it will be tested
PARAM2=$(echo $entrypoint_params | cut -d';' -f2) # the real command separated by &&

printf "==>[entrypoint.sh] %s\n" "PARAM1=$PARAM1"
printf "==>[entrypoint.sh] %s\n" "PARAM2=$PARAM2"

if [ "$PARAM1" = "bash" ];
then
    printf "==>[entrypoint.sh] %s\n" "about to running $PARAM2 command"
    echo $PARAM2 | tr '&&' '\n' | while read cmd; do
        $cmd
    done    
fi



