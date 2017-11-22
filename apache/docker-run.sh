!/bin/bash

CONTAINER_NAME=fzl_apache;
VOLUME_PATH1=$1;

# Change it accordingle of your needs
#CONTAINER_DEFAULT_WWW_HTML="/run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs/env-dev/sources/dojo-fzl-demos/";
CONTAINER_DEFAULT_WWW_HTML="/run/media/wagner/51d54d26-34c8-4671-8da1-c12adc7a5a2c/wagnerdocri@gmail.com2/envs/env-dev-git-clones/dojotoolkitSourcesAndDemos/dojotoolkit"

if [ "X$VOLUME_PATH" = "X" ]; then
    echo "--- Hey, you do not provide a /var/www/html volume...";
    echo "--- Using...";
    echo "--- $CONTAINER_DEFAULT_WWW_HTML"
    echo "--- and /run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs/env-dev/sources/dojo-fzl-demos/"
    echo "--- because a symbolic links I use";
    echo "--- !change it to your web app dir!";
    #if you do not provide a /var/www/html volume
    #this will be provide as default
    #change it to your default dir, where there are your web app
    VOLUME_PATH1="$CONTAINER_DEFAULT_WWW_HTML"
fi;


docker rm $CONTAINER_NAME


docker run \
       --name $CONTAINER_NAME -d \
       -h fzl_apache \
       -p 80:8080 \
       -v "$VOLUME_PATH1":/var/www/html \
       -v "$VOLUME_PATH2":/run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs/env-dev/sources/dojo-fzl-demos/ \
       wagnermarques/fzl_apache 
       
docker logs $CONTAINER_NAME
