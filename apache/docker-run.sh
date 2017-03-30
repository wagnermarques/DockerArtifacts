!/bin/bash

CONTAINER_NAME=fzl_apache;
VOLUME_PATH=$1;

if [ "X$VOLUME_PATH" = "X" ]; then
    echo "--- Hey, you do not provide a /var/www/html volume...";
    echo "--- Using...";
    echo "--- /run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs/env-dev-git-clones/dojotoolkitSourcesAndDemos/dojotoolkit/";
    echo "--- change it to your web app dir";
    #if you do not provide a /var/www/html volume
    #this will be provide as default
    #change it to your default dir, where there are your web app
    VOLUME_PATH="/run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs/env-dev-git-clones/dojotoolkitSourcesAndDemos/dojotoolkit/";
fi;


docker rm $CONTAINER_NAME


docker run \
       --name $CONTAINER_NAME -d \
       -h fzl_apache \
       -p 8080:8090 \
       -v "$VOLUME_PATH":/var/www/html \
       wagnermarques/fzl_apache 
       
docker logs $CONTAINER_NAME
