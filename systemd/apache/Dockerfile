FROM fedora:rawhide
MAINTAINER wagnerdocri@gmail.com

#dnf needs proxy config in this way, but wget...
#uncomment accodingly your proxy configuration
ENV http_proxy=http://cid2:cid2@192.168.0.2:3128/
ENV ftp_proxy=http://cid2:cid2@192.168.0.2:3128/
ENV all_proxy=http://cid2:cid2@192.168.0.2:3128/


RUN dnf -y update
RUN dnf -y install httpd php php-common
RUN dnf -y install php-pecl-apcu php-cli php-pear php-pdo php-mysqlnd php-pgsql php-pecl-mongodb php-pecl-memcache php-pecl-memcached php-gd php-mbstring php-mcrypt php-xml
RUN dnf -y clean all && \
systemctl enable httpd.service

EXPOSE 80

RUN echo "systemd httpd server" > /var/www/html/index.html

RUN systemctl mask systemd-remount-fs.service dev-hugepages.mount sys-fs-fuse-connections.mount systemd-logind.service getty.target console-getty.service dnf-makecache.service
RUN cp /usr/lib/systemd/system/dbus.service /etc/systemd/system/; sed -i 's/OOMScoreAdjust=-900//' /etc/systemd/system/dbus.service

VOLUME ["/run", "/tmp"]

ENV container=docker

CMD ["/usr/sbin/init"]
