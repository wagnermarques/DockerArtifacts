FROM wagnermarques/fzl_java-oracle8-f27:0.0.1

MAINTAINER wagnerdocri@gmail.com

ENV LIFERAYFILE=liferay-ce-portal-tomcat-7.0-ga3-20160804222206210.zip
ENV LIFERAY_HOME=/opt/liferay-ce-portal-7.0-ga3

RUN dnf -y update
RUN dnf -y install findutils \
    tar wget unzip  && dnf clean all

#------
#Installing liferay
#------
RUN wget --output-document /opt/$LIFERAYFILE "https://downloads.sourceforge.net/project/lportal/Liferay%20Portal/7.0.2%20GA3/liferay-ce-portal-tomcat-7.0-ga3-20160804222206210.zip?r=https%3A%2F%2Fwww.liferay.com%2Fdownloads&ts=1485642085&use_mirror=ufpr"
RUN cd /opt && unzip $LIFERAYFILE
RUN touch $LIFERAY_HOME/tomcat-8.0.32/logs/catalina.out
RUN rm /opt/$LIFERAYFILE

ADD ./scripts /scripts

# Define default command.
#CMD $LIFERAY_HOME/tomcat-8.0.32/bin/startup.sh && tail -f $LIFERAY_HOME/tomcat-8.0.32/logs/catalina.out
ENTRYPOINT ["/scripts/entrypoint.sh"]
