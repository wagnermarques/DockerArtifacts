FROM fedora:25

MAINTAINER wagnerdocri@gmail.com

ENV http_proxy=http://wagner:nicolas1*@192.168.0.2:3128/                                                                                                
ENV ftp_proxy=http://wagner:nicolas1*@192.168.0.2:3128/                                                                                                 
ENV all_proxy=http://wagner:nicolas1*@192.168.0.2:3128/ 

RUN dnf -y update && dnf clean all
RUN dnf -y install python3-pip && dnf clean all

RUN mkdir /scripts
ADD ./scripts /scripts

RUN cd /scripts; pip3 --proxy http://wagner:nicolas1*@192.168.0.2:3128/ install  -r requirements.txt

CMD ["python3   ", "--version"]
