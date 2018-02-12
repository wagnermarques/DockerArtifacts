from fedora:23
#https://fedoramagazine.org/run-sql-server-v-next-public-preview-fedora/
#choose repo: https://packages.microsoft.com/config/
#https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-red-hat
#https://docs.microsoft.com/pt-br/sql/linux/sample-unattended-install-redhat
#RUN curl -o /etc/yum.repos.d/mssql-server.repo https://packages.microsoft.com/config/rhel/7/mssql-server.repo

RUN curl https://packages.microsoft.com/config/rhel/7/mssql-server.repo > /etc/yum.repos.d/mssql-server.repo
RUN curl https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/msprod.repo

#RUN curl -o /openssl.rpm http://vault.centos.org/6.9/os/Source/SPackages/openssl-1.0.1e-57.el6.src.rpm
#RUN dnf -y install /openssl.rpm
RUN dnf remove unixODBC
RUN dnf -y update
RUN dnf -y install mssql-server mssql-tools


EXPOSE 1433

ADD start.sh /start.sh 

