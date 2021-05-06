FROM debian:10-slim

#https://developer.fedoraproject.org/tech/languages/c/c_installation.html

MAINTAINER wagnerdocri@gmail.com

RUN apt-get update && apt-get upgrade --yes && apt-get install sudo locales --yes

RUN adduser developer && echo "developer ALL=PASSWD: ALL" > /etc/sudoers.d/developer

RUN apt-get install git build-essential manpages-dev cmake --yes

WORKDIR /projeto

USER developer

