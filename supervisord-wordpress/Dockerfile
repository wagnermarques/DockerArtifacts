FROM fedora:30

MAINTAINER wagnerdocri@gmail.com

#ENV http_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
#ENV ftp_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
#ENV all_proxy=http://wagner:nicolas1*@192.168.0.2:3128/

RUN dnf -y update && dnf -y install httpd
RUN dnf -y install httpd php php-cli php-fpm \
        php-pgsql php-pdo-dblib php-pdo \
        php-devel php-zip php-mysqlnd php-gd php-mcrypt php-mbstring \
        php-curl php-xml php-pear php-bcmath php-json \
        php-react-http-client php-cli
RUN dnf clean all

RUN dnf -y install python-pip  
RUN dnf -y install passwd sudo openssh-server openssh-clients && dnf clean all
RUN pip install supervisor

RUN mkdir -p /var/run/sshd

RUN rm -f /etc/ssh/ssh_config
RUN rm -f /etc/ssh/ssh_config.d/*

# be aware that in docker-run.sh we mapping
# /container_config_folder/ to /etc/supervisord/conf.d
# -v "$(pwd)/container_config_folder":/etc/supervisord/conf.d/ \
# so any supervisord-*.conf in /container_config_folder/ is automatically
# imported in supervidord.conf without COPY necessity.
# if its not what you want change it
COPY /container_config_folder/etc/supervisord.conf            /etc/supervisord.conf
COPY /container_config_folder/usr/local/etc/php-fpm.d/www.conf       /usr/local/etc/php-fpm.d/www.conf
COPY /container_config_folder/supervisord/conf.d/supervisord-sshd.conf        /etc/supervisord/conf.d/
COPY /container_config_folder/supervisord/conf.d/supervisord-httpd.conf       /etc/supervisord/conf.d/


COPY /container_config_folder/ssh_config                  /etc/ssh/ssh_config
COPY /container_config_folder/ssh-05-redhat.conf          /etc/ssh/ssh_config.d/

#RUN mkdir -p /var/log/supervisord


#fzladmin user
RUN mkdir -p /etc/sudoers.d/ && touch /etc/sudoers.d/fzladmin 
RUN mkdir -p /home/fzladmin

RUN echo "fzladmin:x:1000:1000:fzladmin,,,:/home/fzladmin:/bin/bash" >> /etc/passwd
RUN echo "fzladmin:x:1000:" >> /etc/group
RUN echo "fzladmin ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/fzladmin 
RUN chmod 0440 /etc/sudoers.d/fzladmin 
RUN chown fzladmin:fzladmin -R /home/fzladmin
RUN chown root:root /usr/bin/sudo && chmod 4755 /usr/bin/sudo
RUN echo "Admin@ipgg" | passwd --stdin fzladmin

VOLUME /etc/supervisord/conf.d/
VOLUME /var/log/supervisord
VOLUME /scripts
VOLUME /var/www

#in order to evict: ERROR: Unable to create the PID file (/run/php/php-fpm.pid).: No such file or directory (2)
RUN mkdir -p /run/php/

EXPOSE 22 80

CMD /usr/bin/supervisord -c /etc/supervisord.conf
