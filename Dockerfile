FROM tomcat:latest
MAINTAINER subahan subahanshaik.78@gmail.com
COPY subahan-1.war /usr/local/tomcat/webapps
EXPOSE 8080
