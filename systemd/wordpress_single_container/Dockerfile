FROM fedora:28

MAINTAINER wagnerdocri@gmail.com


#dnf needs proxy config in this way, but wget...
#uncomment accodingly your proxy configuration
ENV http_proxy=http://cid2:cid2@192.168.0.2:3128/
ENV ftp_proxy=http://cid2:cid2@192.168.0.2:3128/
ENV all_proxy=http://cid2:cid2@192.168.0.2:3128/

RUN dnf -y update
RUN dnf -y install mariadb mariadb-server httpd php php-gd pwgen supervisor bash-completion openssh-server psmisc tar php-pecl-apcu php-cli php-pear php-pdo php-pgsql php-pecl-mongodb php-pecl-memcache php-pecl-memcached php-gd php-mbstring php-mcrypt php-xml
RUN dnf clean all

ADD ./start.sh /start.sh
ADD ./foreground.sh /etc/apache2/foreground.sh
ADD ./supervisord.conf /etc/supervisord.conf
RUN echo %sudo	ALL=NOPASSWD: ALL >> /etc/sudoers
ADD http://wordpress.org/latest.tar.gz /wordpress.tar.gz
RUN tar xvzf /wordpress.tar.gz 
RUN mv /wordpress/* /var/www/html/.
RUN chown -R apache:apache /var/www/
RUN chmod 755 /start.sh
RUN chmod 755 /etc/apache2/foreground.sh
RUN mkdir /var/run/sshd
EXPOSE 80
CMD ["/bin/bash", "/start.sh"]
