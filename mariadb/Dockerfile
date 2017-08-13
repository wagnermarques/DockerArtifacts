FROM fedora

MAINTAINER wagnerdocri@gmail.com

#dnf needs proxy config in this way, but wget...
#uncomment accodingly your proxy configuration
ENV http_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
ENV ftp_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
ENV all_proxy=http://wagner:nicolas1*@192.168.0.2:3128/


RUN dnf -y update && dnf clean all
RUN dnf -y install mariadb-server pwgen psmisc net-tools hostname && \
    dnf clean all

ADD scripts /scripts
RUN chmod 755 /scripts/*

#I prefer configure volume with -v parameter of docker run
#VOLUME ["/var/lib/mysql", "/var/log/mysql"]
#       -v $DATA_DIR:/var/lib/mysql \
#       -v LOG_DIR:/var/log/mysql \

EXPOSE 3306

CMD ["/bin/bash", "/scripts/start.sh"]
