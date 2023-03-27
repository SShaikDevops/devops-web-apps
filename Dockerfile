FROM tomcat:latest
MAINTAINER narayana narayanareddy8042@gmail.com
COPY narayana-1.war /usr/local/tomcat/webapps
EXPOSE 8080
