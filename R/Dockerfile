FROM wagnermarques/java-oracle8-f27:0.0.1

MAINTAINER wagnerdocri@gmail.com

#dnf needs proxy config in this way, but wget...
#uncomment accodingly your proxy configuration
#ENV http_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
#ENV ftp_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
#ENV all_proxy=http://wagner:nicolas1*@192.168.0.2:3128/


RUN dnf -y update
RUN dnf -y install unzip R texlive* && dnf clean all


