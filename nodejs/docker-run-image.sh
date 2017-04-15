#!/bin/bash

IMAGE_NAME=wagnermarques/fzl_nodejs:0.0.1;
PROJECTS_DIR="/run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs/env-dev/nodejsprojects"
COMMAND_TO_RUN=$1

if ["x$COMMAND_TO_RUN" == "x" ];
then{
    echo "Please provide a command a its options to be runned in the image";
    echo "The default command is node -version";
    $COMMAND_TO_RUN="nojde -version";
}
fi

docker run -it -v  $IMAGE_NAME $COMMAND_TO_RUN

