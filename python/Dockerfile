FROM fedora:25

MAINTAINER wagnerdocri@gmail.com

RUN dnf -y update && dnf clean all
RUN dnf -y install python3-pip && dnf clean all

RUN mkdir /scripts
ADD ./scripts /scripts

RUN cd /scripts; pip3 install -r requirements.txt

CMD ["python3   ", "--version"]
