FROM openweb/oracle-tomcat:7-jre7
LABEL author="Rafael Pereira<rafaelszp.info@gmail.com>"
LABEL scmURL="https://github.com/rafaelszp/tomcat-jtds-keycloak"

##ADDING LIBRARIES
ADD http://central.maven.org/maven2/net/sourceforge/jtds/jtds/1.3.1/jtds-1.3.1.jar /usr/local/tomcat/lib/
ADD https://downloads.jboss.org/keycloak/3.4.0.Final/adapters/keycloak-oidc/keycloak-tomcat7-adapter-dist-3.4.0.Final.tar.gz /usr/local/tomcat/lib/
ADD http://central.maven.org/maven2/net/sf/jasperreports/jasperreports-fonts/6.0.0/jasperreports-fonts-6.0.0.jar /usr/local/tomcat/lib/
RUN cd /usr/local/tomcat/lib/ && tar zxf keycloak-tomcat7-adapter-dist-3.4.0.Final.tar.gz && rm keycloak-tomcat7-adapter-dist-3.4.0.Final.tar.gz

RUN rm /usr/local/tomcat/webapps/* -rf
#RUN mkdir /usr/local/tomcat/webapps/ROOT -p && touch /usr/local/tomcat/webapps/ROOT/index.html
#RUN mkdir /usr/local/tomcat/webapps/healthz -p && touch /usr/local/tomcat/webapps/healthz/index.html

#RUN apk update; apk add ttf-dejavu ttf-ubuntu-font-family ttf-freefont ttf-droid-nonlatin ttf-droid ttf-linux-libertine 
RUN apt-get update; apt-get install ttf-dejavu fonts-freefont-ttf ttf-ubuntu-font-family fonts-linuxlibertine wget -y
