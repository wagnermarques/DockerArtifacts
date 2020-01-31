FROM fedora:29

MAINTAINER wagnerdocri@gmail.com

ENV http_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
ENV ftp_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
ENV all_proxy=http://wagner:nicolas1*@192.168.0.2:3128/

RUN dnf -y update
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
COPY /container_config_folder/supervisord.conf            /etc/supervisord.conf
COPY /container_config_folder/supervisord-sshd.conf       /etc/supervisord/conf.d/
COPY /container_config_folder/supervisord-test.conf       /etc/supervisord/conf.d/

COPY /container_config_folder/ssh_config                  /etc/ssh/ssh_config
COPY /container_config_folder/ssh-05-redhat.conf          /etc/ssh/ssh_config.d/


RUN mkdir -p /etc/supervisord/conf.d/
RUN mkdir -p /var/log/supervisord
RUN mkdir -p /scripts

#fzladmin user
RUN mkdir -p /etc/sudoers.d/ && touch /etc/sudoers.d/fzladmin 
RUN mkdir -p /home/fzladmin

RUN echo "fzladmin:x:1000:1000:fzladmin,,,:/home/fzladmin:/bin/bash" >> /etc/passwd
RUN echo "fzladmin:x:1000:" >> /etc/group
RUN echo "fzladmin ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/fzladmin 
RUN chmod 0440 /etc/sudoers.d/fzladmin 
RUN chown fzladmin:fzladmin -R /home/fzladmin
RUN chown root:root /usr/bin/sudo && chmod 4755 /usr/bin/sudo
RUN echo "admin123" | passwd --stdin fzladmin

VOLUME /etc/supervisord/conf.d/
VOLUME /var/log/supervisord
VOLUME /scripts
EXPOSE 22

CMD /usr/bin/supervisord -c /etc/supervisord.conf
