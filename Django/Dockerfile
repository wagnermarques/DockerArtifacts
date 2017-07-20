FROM wagnermarques/fzl_python:0.0.0.1
    
#FROM fedora:25

MAINTAINER wagner@gmail.com

RUN dnf -y update && dnf clean all
RUN dnf -y install python3-pip \
                   python-devel python3-devel \
                   MySQL-python3 && dnf clean all

# create directory /code and mount sources there

RUN mkdir /django_project
#RUN mkdir /scripts #not needed because was created in fzl_python:0.0.0.1

ADD /scripts /scripts
RUN chmod +x /scripts/*.sh
RUN cd /scripts; ls -ilha
RUN sh /scripts/pip-pkgs-installation.sh

WORKDIR /django_project
VOLUME /django_project

EXPOSE 8000

ENTRYPOINT ["/scripts/entrypoint.sh"]

