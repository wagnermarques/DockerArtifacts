
FROM fedora:25

MAINTAINER wagnerdocri@gmail.com

# Install nodejs and npm
RUN dnf -y update && dnf -y install npm && dnf clean all

# Show nodejs and npm versions installed
RUN node -v
RUN npm -v

#
# Configurations for dojo2 apps
# from http://dojo.io/tutorials/000_local_installation/index.html
#
#This command installs the Dojo command-line tool (@dojo/cli) to simplify development tasks related to creating, testing, and building your applications. Initially, the @dojo/cli tool comes with three commands:

#    create - Provides a skeleton template for Dojo 2 projects
#    eject - Disconnects a project from @dojo/cli allowing advanced users to customise configuration
#    version - Reports the version of @dojo/cli and any commands that are installed

npm install -g @dojo/cli



# Set port for nodejs to listen on and expose it
ENV PORT 8080
EXPOSE 8080

# Set production environment for nodejs application
ENV NODE_ENV=production

# Make directory for our nodejs project
RUN mkdir /container_projects_dir


ADD scripts /scripts

# I am not intent to run a single app withing de container but several, or just to build them with
# pre configured isolated (by container) global node module
# Run it!
#CMD ["node", "/src/index.js"]
