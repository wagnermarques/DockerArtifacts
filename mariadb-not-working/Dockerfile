FROM fedora:25
#based on: https://github.com/docker-library/mariadb/blob/1037a0b7ab09343e011826078fbdffb0bf465fc3/10.3/Dockerfile

MAINTAINER wagnerdocri@gmail.com

#dnf needs proxy config in this way, but wget...
#uncomment accodingly your needs 
#ENV http_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
##ENV ftp_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
#ENV all_proxy=http://wagner:nicolas1*@192.168.0.2:3128/


# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN dnf -y update && dnf clean all
RUN dnf -y install mariadb-server pwgen psmisc net-tools hostname && \
    dnf clean all

RUN mkdir -p /var/lib/mysql/


ADD scripts /scripts
RUN chmod 755 /scripts/*

ADD etc/my.cnf /etc

#I prefer configure volume with -v parameter of docker run
#VOLUME ["/var/lib/mysql", "/var/log/mysql"]
#       -v $DATA_DIR:/var/lib/mysql \
#       -v LOG_DIR:/var/log/mysql \

EXPOSE 3306

CMD ["/bin/bash", "/scripts/start.sh"]
