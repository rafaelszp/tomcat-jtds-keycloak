FROM tomcat:7.0.82-alpine
LABEL author="Rafael Pereira<rafaelszp.info@gmail.com>"
LABEL scmURL="https://github.com/rafaelszp/tomcat-jtds-keycloak"

ADD http://central.maven.org/maven2/net/sourceforge/jtds/jtds/1.3.1/jtds-1.3.1.jar /usr/local/tomcat/lib/
ADD https://downloads.jboss.org/keycloak/3.4.0.Final/adapters/keycloak-oidc/keycloak-tomcat7-adapter-dist-3.4.0.Final.tar.gz /usr/local/tomcat/lib/
RUN cd /usr/local/tomcat/lib/ && tar zxf keycloak-tomcat7-adapter-dist-3.4.0.Final.tar.gz && rm keycloak-tomcat7-adapter-dist-3.4.0.Final.tar.gz