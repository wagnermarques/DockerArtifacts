FROM fedora:27

MAINTAINER wagnerdocri@gmail.com

#ENV http_proxy=http://cid2:cid2@192.168.0.2:3128/
#ENV ftp_proxy=http://cid2:cid2@192.168.0.2:3128/
#ENV all_proxy=http://cid2:cid2@192.168.0.2:3128/


# Install nodejs and npm
RUN dnf -y update

#gyp ERR! stack Error: Can't find Python executable "python", you can set the PYTHON env variable.
RUN dnf -y install nodejs npm git gcc-c++ python
RUN dnf clean all

#RUN npm config set proxy http://cid2:cid2@192.168.0.2:3128/


RUN npm install -g jquery
RUN npm install -g express
RUN npm install -g http-server #to have a local server run

RUN npm install -g grunt-cli grunt-tslint
RUN npm install -g yo generator-generator
RUN npm install -g webpack

RUN npm install -g typescript
RUN npm install -g ts-loader  #links webpack to complie typescript
RUN npm install -g @dojo/cli-create-app


#
# Configurations for dojo2 apps
# from http://dojo.io/tutorials/000_local_installation/index.html
#
#This command installs the Dojo command-line tool (@dojo/cli) to simplify development tasks related to creating, testing, and building your applications. Initially, the @dojo/cli tool comes with three commands:

#    create - Provides a skeleton template for Dojo 2 projects
#    eject - Disconnects a project from @dojo/cli allowing advanced users to customise configuration
#    version - Reports the version of @dojo/cli and any commands that are installed
RUN npm install -g @dojo/cli

#In order to create your first Dojo 3 application, you need to globally install the @dojo/cli-create-app command which creates a template project to get started:
RUN npm install -g @dojo/cli-create-app


# Set port for nodejs to listen on and expose it
ENV PORT 3000
EXPOSE 3000

# Set production environment for nodejs application
ENV NODE_ENV=production

ADD scripts /scripts
RUN mkdir /node_project
# I am not intent to run a single app withing de container but several, or just to build them with
# pre configured isolated (by container) global node module
# Run it!
#CMD ["node", "/src/index.js"]
ENTRYPOINT ["/scripts/entrypoint.sh"]
