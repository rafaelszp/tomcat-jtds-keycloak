#FROM openweb/oracle-tomcat:7-jre7
FROM tomcat:9-jre8-alpine as tomcat9
LABEL author="Rafael Pereira<rafaelszp.info@gmail.com>"
LABEL scmURL="https://github.com/rafaelszp/tomcat-jtds-keycloak"
#ENV PATH="/opt/zulu8.38.0.13-ca-jdk8.0.212-linux_x64/bin:${PATH}"
#ENV JAVA_HOME="/opt/zulu8.38.0.13-ca-jdk8.0.212-linux_x64"

##ADDING LIBRARIES
ADD http://central.maven.org/maven2/net/sourceforge/jtds/jtds/1.3.1/jtds-1.3.1.jar /usr/local/tomcat/lib/
ADD https://downloads.jboss.org/keycloak/3.4.0.Final/adapters/keycloak-oidc/keycloak-tomcat8-adapter-dist-3.4.0.Final.tar.gz /usr/local/tomcat/lib/
ADD http://central.maven.org/maven2/net/sf/jasperreports/jasperreports-fonts/6.0.0/jasperreports-fonts-6.0.0.jar /usr/local/tomcat/lib/
RUN cd /usr/local/tomcat/lib/ && tar zxf keycloak-tomcat8-adapter-dist-3.4.0.Final.tar.gz && rm keycloak-tomcat8-adapter-dist-3.4.0.Final.tar.gz

RUN rm /usr/local/tomcat/webapps/* -rf

FROM azul/zulu-openjdk-alpine:8
ENV PATH="/usr/local/tomcat/bin:${PATH}"
RUN apk update; apk add ttf-dejavu ttf-ubuntu-font-family ttf-freefont ttf-droid-nonlatin ttf-droid ttf-linux-libertine bash curl
COPY --from=tomcat9 /usr/local/tomcat /usr/local/tomcat

ENTRYPOINT catalina.sh run
