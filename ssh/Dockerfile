FROM docker.io/fedora:31
MAINTAINER wagnerdocri@gmail.com

EXPOSE 22

RUN dnf -y update && dnf -y install openssh-server passwd && dnf clean all

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D"]
