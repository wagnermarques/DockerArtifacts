FROM fedora:27

#ENV http_proxy="http://wagner:nicolas1*@192.168.0.2:3128"
#ENV https_proxy="http://wagner:nicolas1*@192.168.0.2:3128"
#ENV ftp_proxy="http://wagner:nicolas1*@192.168.0.2:3128"
#ENV all_proxy="http://wagner:nicolas1*@192.168.0.2:3128"

MAINTAINER wagnerdocri@gmail.com
#https://developer.fedoraproject.org/tech/languages/csharp/dotnet-installation.html

#To enable the .NET SIGs copr repository:
RUN dnf -y install 'dnf-command(copr)'
RUN dnf -y copr enable @dotnet-sig/dotnet

RUN dnf -y update
RUN dnf -y install dotnet-sdk-2.1
RUN dnf clean all
RUN dotnet -v


