#!/bin/bash

IMAGE_NAME=wagnermarques/fzl_nodejs:0.0.1;
PROJECTS_DIR="/home/wagner/wagnerdocri@gmail.com3/envs/env-dev/sources/nodeprojects"
COMMAND_TO_RUN=$1

if [ "x$COMMAND_TO_RUN" == "x" ];
then
    {
        echo ">>> Please provide a command and its options to be runned in the image";
        echo ">>> The default command is node -version";
        echo ">>> some usage examples"
        echo ">>> "
        echo ">>> ./docker-run-image.sh bash:dojo create app --name first-dojo-app"
        echo ">>> ./docker-run-image.sh bash:ls -l #fix-me: makes entrypoint undertande -l parameter"
        echo ">>> ./docker-run-image.sh bash:cd node_project && ls -l #this -l is considered now"
        echo ">>> ./docker-run-image.sh bash:cd node_project && dojo create app --name first-dojo-app"
        
        
        COMMAND_TO_RUN="bash:npm -l";
    }
fi
echo ">>> Running... docker run -it --name=\"nodejs_running_cmd\" $IMAGE_NAME $COMMAND_TO_RUN"
docker run -it  --name "nodejs_running_cmd" $IMAGE_NAME $COMMAND_TO_RUN
docker rm nodejs_running_cmd



