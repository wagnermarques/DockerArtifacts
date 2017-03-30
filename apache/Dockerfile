FROM fedora:25

MAINTAINER http://fedoraproject.org/wiki/Cloud

#from:https://hub.docker.com/r/fedora/apache/~/dockerfile/           
# The following label is used to run the image with the Atomic tool. It is not required and will be skipped by a `docker run`.
LABEL RUN='docker run -d -p 80:80 $IMAGE'


# Updating dependencies, installing Apache and cleaning dnf caches to reduce container size
# php-fpm.x86_64 : PHP FastCGI Process Manager
#
RUN dnf -y update && dnf -y install httpd php php-common php-fpm php-pdo php-gd php-pgsql php-mysqlInd php-xml php-pecl-memcache php-pecl-memcached php-mcrypt php-mbstring -y && dnf clean all


ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2


# Creating placeholder file to be served by apache
RUN echo "Apache index.html Response from Container" >> /var/www/html/index.html
# We are acception volume whe docker run this container

# We open 80 port, the default one for HTTP for Apache server to listen on
EXPOSE 80

# Simple startup script to avoid some issues observed with container restart 
ADD run-apache.sh /run-apache.sh

RUN chmod -v +x /run-apache.sh

CMD ["/run-apache.sh"]
