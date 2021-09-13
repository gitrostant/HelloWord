# Pull base image 
FROM tomcat:8.0-alpine

# Maintainer 
MAINTAINER "valaxytech@gmail.com" 
RUN sudo addgroup --system docker
RUN sudo adduser $USER docker
RUN newgrp docker
RUN sudo setfacl -m "g:docker:rw" /var/run/docker.sock
COPY ./webapp.war /usr/local/tomcat/webapps

