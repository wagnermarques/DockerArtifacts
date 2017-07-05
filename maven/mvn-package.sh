#!/bin/bash

PROJECT_NAME_DIR=$1 #maven projects has its directory whith the same name os the project when created
MVN_PROJECTS_DIR="/run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs/env-dev/mvnprojects";

echo "warn: The maven container uses $MVN_PROJECTS_DIR";
echo "as the workspace directory. This was setted at docker run with -v parameter";
echo .
echo "PROJECT_NAME_DIR informed = $PROJECT_NAME_DIR";

if [ "x$PROJECT_NAME_DIR" == "x" ];
then
    {
        echo "Please inform the project dir where pom.xml of the project are";
        echo .
        exit 1;
    }
fi


if [ "$PROJECT_NAME_DIR" == "list" ];
then    
    {
        echo "Listing /container_maven_projects dir (mounted volume)";
        docker exec -it fzl_maven  ls -ilha /container_mvn_projects

        echo "fzlbpms-artifacts maven artifacts...";
        echo "/container_mvn_projects/fzlbpms-artifacts/maven-artifacts";
        docker exec -it fzl_maven  ls -ilha /container_mvn_projects/fzlbpms-artifacts/maven-artifacts

        exit 0;
    }
fi

if [ "$PROJECT_NAME_DIR" == "fzl_web_primefaces" ];
then    
    {
        docker exec -it fzl_maven  /scripts/mvn-clean.sh fzlbpms-artifacts/maven-artifacts/fzlparent
        docker exec -it fzl_maven  /scripts/mvn-install.sh fzlbpms-artifacts/maven-artifacts/fzlparent
        docker exec -it fzl_maven  /scripts/mvn-package.sh fzlbpms-artifacts/maven-artifacts/fzl_web_primefaces
        exit 0;
    }
fi


docker exec -it fzl_maven  /scripts/mvn-package.sh $PROJECT_NAME_DIR
