#!/bin/bash
#
# Usage:
# gcc.sh /path/to/cc++/cc++file.c
# 
# This script will run gcc inside container
# The container name will be the name of cc++ project directory
# The container will be removed after script runs
#
fullPathOfCFile=$1
invertedScriptFilePath=$(rev <<< $fullPathOfCFile);
OLDIFS="$IFS"
IFS='/' #  (/) is set as delimiter

function extractScriptFileNameAndScriptDirectoryPath(){

    #inverted script file path is readed in a array with IFS='/' file delimiter
    read -ra arrScriptPathInv <<< $invertedScriptFilePath
    IFS=$OLDIFS #after read command we can set IFS alone
    
    cFileName=$(rev <<< ${arrScriptPathInv[0]})

    i=${#arrScriptPathInv}
    until [[ $i -eq 0 ]]
    do
        scriptPathDir="$scriptPathDir/$(rev <<< ${arrScriptPathInv[$i]})"
        ((i--))
    done    
}

extractScriptFileNameAndScriptDirectoryPath

CONTAINER_NAME=$cFileName
SOURCES_DIR=$scriptPathDir
SOURCES_DIR_BASE_NAME=$(basename $scriptPathDir)
IMG_NAME="wagnermarques/ccppdeb10:0.0.1"

echo CONTAINER_NAME=$CONTAINER_NAME
echo SOURCES_DIR=$SOURCES_DIR
echo SOURCES_DIR_BASE_NAME=$SOURCES_DIR_BASE_NAME
echo IMG_NAME=$IMG_NAME


docker run -it --rm --name $CONTAINER_NAME \
       -v $SOURCES_DIR:/sources --workdir /sources \
       $IMG_NAME gcc /sources/$cFileName
