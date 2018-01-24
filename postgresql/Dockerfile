FROM fedora:27

MAINTAINER wagnerdocri@gmail.com

#https://www.postgresql.org/docs/10/static/install-requirements.html
#https://github.com/docker-library/postgres/blob/82e8101ff612b492507f4efc2120963b29f4188d/9.6/Dockerfile

#dnf needs proxy config in this way, but wget...
#uncomment accodingly your proxy configuration
#ENV http_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
#ENV ftp_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
#ENV all_proxy=http://wagner:nicolas1*@192.168.0.2:3128/

RUN dnf -y update
RUN dnf -y install postgresql-server postgresql-contrib  postgresql-jdbc
RUN dnf -y update glibc-common  && dnf -y reinstall glibc-common
RUN dnf -y clean all

ADD ./scripts /scripts
ADD ./container_shared_folder /container_shared_folder
ADD ./container_config_files /container_config_files

RUN chmod -v +x /scripts/*.sh
RUN chown postgres:postgres /container_shared_folder
RUN chown postgres:postgres /container_config_files

RUN echo 'LANG="pt_BR.UTF-8"' >  /etc/locale.conf

EXPOSE 5432

USER postgres 

ENTRYPOINT ["/scripts/entrypoint.sh"]

