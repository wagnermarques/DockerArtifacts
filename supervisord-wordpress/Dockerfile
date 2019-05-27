FROM wagnermarques/fzl_supervisord-httpd-php7:0.0.1

MAINTAINER wagnerdocri@gmail.com

#ENV http_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
#ENV ftp_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
#ENV all_proxy=http://wagner:nicolas1*@192.168.0.2:3128/



VOLUME /etc/supervisord/conf.d/
VOLUME /var/log/supervisord
VOLUME /scripts
EXPOSE 22 80

CMD /usr/bin/supervisord -c /etc/supervisord.conf
