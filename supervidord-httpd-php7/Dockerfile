FROM wagnermarques/fzl_supervisord:0.0.1

MAINTAINER wagnerdocri@gmail.com

#ENV http_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
#ENV ftp_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
#ENV all_proxy=http://wagner:nicolas1*@192.168.0.2:3128/

RUN dnf -y update && dnf -y install httpd
RUN dnf -y install php php-cli php-fpm \
        php-pgsql php-pdo-dblib php-pdo \
        php-devel php-zip php-mysqlnd php-gd php-mcrypt php-mbstring \
        php-curl php-xml php-pear php-bcmath php-json \
        php-react-http-client php-cli
RUN dnf clean all

#https://medium.com/@shrikeh/setting-up-nginx-and-php-fpm-in-docker-with-unix-sockets-6fdfbdc19f91
RUN groupadd --gid 3000 --system www-data
RUN useradd --uid 3000 --gid 3000 \
        -r -d /var/lib/sshd/ \
        -c "httpd www-data privsep" -s /bin/false www-data


RUN mkdir -p /usr/local/etc/php-fpm.d
RUN mkdir -p /run/php-fpm/
RUN mkdir -p /etc/fpm/pool.d/
#php-fpm-www.conf define pid in /run/php
#pid = /run/php/php-fpm.pid
RUN mkdir -p /run/php/


COPY /container_config_folder/php-fpm-www.conf  /usr/local/etc/php-fpm.d/www.conf
COPY /container_config_folder/php.conf  /etc/httpd/conf.d/php.conf
COPY /container_config_folder/httpd.conf  /etc/httpd/conf/httpd.conf

#COPY /container_config_folder/php-fpm-pool.conf /etc/fpm/pool.d/pool.conf


COPY /container_config_folder/php.ini /etc/php.ini



VOLUME /var/www/html
EXPOSE 80

WORKDIR /var/www/html

CMD /usr/bin/supervisord -c /etc/supervisord.conf
