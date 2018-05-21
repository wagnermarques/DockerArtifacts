FROM fedora:27

MAINTAINER wagnerdocri@gmail.com

#ENV http_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
#ENV ftp_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
#ENV all_proxy=http://wagner:nicolas1*@192.168.0.2:3128/


# Install nodejs and npm
RUN dnf -y update
RUN dnf -y install nodejs npm
RUN dnf clean all

#RUN npm config set proxy http://wagner:nicolas1*@192.168.0.2:3128/


# Show nodejs and npm versions installed
RUN node -v
RUN npm -v

RUN npm install -g grunt-cli
RUN npm install -g yo generator-generator
RUN npm install -g webpack

RUN npm install -g typescript
RUN npm install -g ts-loader  #links webpack to complie typescript
RUN npm install -g jquery  #to use jquery in your project
RUN npm install -g express

RUN npm install -g http-server #to have a local server run


#
# Configurations for dojo2 apps
# from http://dojo.io/tutorials/000_local_installation/index.html
#
#This command installs the Dojo command-line tool (@dojo/cli) to simplify development tasks related to creating, testing, and building your applications. Initially, the @dojo/cli tool comes with three commands:

#    create - Provides a skeleton template for Dojo 2 projects
#    eject - Disconnects a project from @dojo/cli allowing advanced users to customise configuration
#    version - Reports the version of @dojo/cli and any commands that are installed

RUN npm install -g @dojo/cli



# Set port for nodejs to listen on and expose it
ENV PORT 3000
EXPOSE 3000

# Set production environment for nodejs application
ENV NODE_ENV=production

ADD scripts /scripts

# I am not intent to run a single app withing de container but several, or just to build them with
# pre configured isolated (by container) global node module
# Run it!
#CMD ["node", "/src/index.js"]
ENTRYPOINT ["/scripts/entrypoint.sh"]
