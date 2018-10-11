FROM fedora:28

MAINTAINER wagnerdocri@gmail.com

#dnf needs proxy config in this way, but wget...
#uncomment accodingly your proxy configuration
ENV http_proxy=http://cid2:cid2@192.168.0.2:3128/
ENV ftp_proxy=http://cid2:cid2@192.168.0.2:3128/
ENV all_proxy=http://cid2:cid2@192.168.0.2:3128/


# Updating dependencies, installing Apache and cleaning dnf caches to reduce container size
# php-fpm.x86_64 : PHP FastCGI Process Manager
#

#https://www.if-not-true-then-false.com/2010/install-apache-php-on-fedora-centos-red-hat-rhel/
RUN dnf -y update 
RUN dnf -y install httpd php php-common
RUN dnf -y install php-pecl-apcu php-cli php-pear php-pdo php-mysqlnd php-pgsql php-pecl-mongodb php-pecl-memcache php-pecl-memcached php-gd php-mbstring php-mcrypt php-xml
RUN dnf clean all


ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2


# Creating placeholder file to be served by apache
RUN echo "Apache index.html Response from Container" >> /var/www/html/index.html
# We are acception volume whe docker run this container

# We open 80 port, the default one for HTTP for Apache server to listen on
EXPOSE 80

# Simple startup script to avoid some issues observed with container restart
#ADD ./container_config_folder/conf.d /etc/httpd/conf.d
#ADD ./container_config_folder/httpd.conf /etc/httpd/conf/httpd.conf
#ADD ./container_config_folder/php.ini /etc/php.ini
ADD ./container_config_folder/run-apache.sh /run-apache.sh

RUN chmod -v +x /run-apache.sh

CMD ["/run-apache.sh"]
