FROM fedora:30
MAINTAINER wagnerdocri@gmail.com

ENV RUBY_VERSION=2.6.3

RUN dnf -y update
RUN dnf -y group install "C Development Tools and Libraries"
RUN dnf -y install findutils git openssl-devel readline-devel zlib-devel 
RUN dnf clean all

RUN mkdir -p /home/developer && \
    echo "developer:x:1000:1000:developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:1000:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown developer:developer -R /home/developer

ADD entrypoint.sh /entrypoint.sh
RUN chown developer:developer /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER developer

RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv
RUN git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build 
RUN cd ~/.rbenv && src/configure && make -C src
RUN ~/.rbenv/bin/rbenv init -

#https://stackoverflow.com/questions/18681462/rbenv-shell-not-command
ENV PATH=$PATH:/home/developer/.rbenv/bin:/home/developer/.rbenv/shims:

#RUN curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

RUN rbenv install $RUBY_VERSION
RUN rbenv rehash
RUN rbenv global $RUBY_VERSION
RUN ruby -v

RUN gem install bundler jekyll

ENTRYPOINT ["/entrypoint.sh"]
