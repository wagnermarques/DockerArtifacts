FROM fedora
MAINTAINER wagnerdocri@gmail.com

#https://developer.fedoraproject.org/tech/languages/ruby/ruby-installation.html 
RUN dnf -y update && dnf clean all
RUN dnf -y install ruby-devel git && dnf clean all
RUN dnf -y group install "C Development Tools and Libraries"
RUN dnf -y install ruby-devel zlib-devel
RUN gem install rails
