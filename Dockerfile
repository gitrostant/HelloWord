# Pull base image 
FROM tomcat:8.0-alpine

# Maintainer 
MAINTAINER "valaxytech@gmail.com" 
COPY ./webapp.war /usr/local/tomcat/webapps

