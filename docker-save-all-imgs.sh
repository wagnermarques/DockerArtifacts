#!/bin/bash
#https://muchweb.me/docker-export-all-images/


#DOCKER_SAVED_IMGS_DIR="/run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs/env-docker-bk-images/";
                       
#IMAGES=$(docker images | grep 'wagnermarques/' | awk '{print $1}');

   
#for imgName in $IMAGES; do

#   imgSavedFileName=
#   echo $imgSavedFileName;
#   #docker save $imgName > "$DOCKER_SAVED_IMGS_DIR/$imgName-$(date +%F).tar"
#done;

#!/bin/bash

IMAGES=$(docker images | grep 'wagnermarques/' | grep -o '^\S*')

while IFS= read -r line; do
    FILENAME=$(printf '%s' "$line" | sed -n 's/username\///p')
    echo "Saving image \"$line:latest\" to \"$FILENAME.tar\"..."
    docker save "$line:latest" > "$FILENAME.tar"
done <<< "$IMAGES"
