FROM debian:10-slim

#https://developer.fedoraproject.org/tech/languages/c/c_installation.html

MAINTAINER wagnerdocri@gmail.com

#dnf needs proxy config in this way, but wget...
#uncomment accodingly your proxy configuration
#ENV http_proxy=http://osinstall:admin123*@192.168.0.2:3128/
#ENV ftp_proxy=http://osinstall:admin123@192.168.0.2:3128/
#ENV all_proxy=http://osinstall:admin123@192.168.0.2:3128/
ENV http_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
ENV ftp_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
ENV all_proxy=http://wagner:nicolas1*@192.168.0.2:3128/

ADD apt.conf /etc/apt/apt.conf

RUN apt update && apt upgrade --yes && apt install sudo locales --yes

RUN adduser developer && echo "developer ALL=PASSWD: ALL" > /etc/sudoers.d/developer

RUN apt install htop git build-essential manpages-dev cmake --yes

WORKDIR /projeto

USER developer

