# Pull base image 
FROM tomcat:8.0-alpine

# Maintainer 
MAINTAINER "valaxytech@gmail.com" 
EXPOSE 8080 
COPY ./webapp/target/*.war /usr/local/tomcat/webapps
