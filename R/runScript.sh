#!/bin/bash
#
# Usage:
# runScript.sh /path/to/R/script.R
# 
# This script will run your script.R inside container
# The container name will be the name of the R script file
# The container will be removed after script runs
#
SCRIPT=$1
invertedScriptFilePath=$(rev <<< $1);
OLDIFS="$IFS"
IFS='/' #  (/) is set as delimiter

function extractScriptFileNameAndScriptDirectoryPath(){

    #inverted script file path is readed in a array with IFS='/' file delimiter
    read -ra arrScriptPathInv <<< $invertedScriptFilePath
    IFS=$OLDIFS #after read command we can set IFS alone
    
    scriptFileName=$(rev <<< ${arrScriptPathInv[0]})

    i=${#arrScriptPathInv}
    until [[ $i -eq 0 ]]
    do
        scriptPathDir="$scriptPathDir/$(rev <<< ${arrScriptPathInv[$i]})"
        ((i--))
    done    
}

extractScriptFileNameAndScriptDirectoryPath

CONTAINER_NAME=$scriptFileName
SOURCE_DIR=$scriptPathDir
IMG_NAME="wagnermarques/fzl_r:0.0.1"

docker run -it --rm --name $CONTAINER_NAME -v $SOURCE_DIR:/sources --workdir /sources $IMG_NAME Rscript --default-packages=methods,utils,grDevices,stats -e 'sessionInfo()' $scriptFileName
