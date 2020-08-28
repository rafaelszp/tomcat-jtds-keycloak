#FROM openweb/oracle-tomcat:7-jre7
FROM tomcat:9-jre8-alpine as tomcat9
LABEL author="Rafael Pereira<rafaelszp.info@gmail.com>"
LABEL scmURL="https://github.com/rafaelszp/tomcat-jtds-keycloak"
#ENV PATH="/opt/zulu8.38.0.13-ca-jdk8.0.212-linux_x64/bin:${PATH}"
#ENV JAVA_HOME="/opt/zulu8.38.0.13-ca-jdk8.0.212-linux_x64"

##ADDING LIBRARIES
ADD https://repo1.maven.org/maven2/net/sourceforge/jtds/jtds/1.3.1/jtds-1.3.1.jar /usr/local/tomcat/lib/
ADD https://downloads.jboss.org/keycloak/3.4.0.Final/adapters/keycloak-oidc/keycloak-tomcat8-adapter-dist-3.4.0.Final.tar.gz /usr/local/tomcat/lib/
ADD https://repo1.maven.org/maven2/net/sf/jasperreports/jasperreports-fonts/6.0.0/jasperreports-fonts-6.0.0.jar /usr/local/tomcat/lib/
RUN cd /usr/local/tomcat/lib/ && tar zxf keycloak-tomcat8-adapter-dist-3.4.0.Final.tar.gz && rm keycloak-tomcat8-adapter-dist-3.4.0.Final.tar.gz

RUN rm /usr/local/tomcat/webapps/* -rf

FROM azul/zulu-openjdk-alpine:8
ENV PATH="/usr/local/tomcat/bin:${PATH}"
RUN apk update; apk add ttf-dejavu ttf-ubuntu-font-family ttf-freefont ttf-droid-nonlatin ttf-droid ttf-linux-libertine bash curl msttcorefonts-installer

RUN apk add terminus-font \
    && apk add font-noto \
    && apk add font-noto-adlam \
    && apk add font-noto-adlamunjoined \
    && apk add font-noto-arabic \
    && apk add font-noto-armenian \
    && apk add font-noto-avestan \
    && apk add font-noto-bamum \
    && apk add font-noto-bengali \
    && apk add font-noto-buhid \
    && apk add font-noto-carian \
    && apk add font-noto-chakma \
    && apk add font-noto-cherokee \
    && apk add font-noto-cypriot \
    && apk add font-noto-deseret \
    && apk add font-noto-devanagari \
    && apk add font-noto-ethiopic \
    && apk add font-noto-extra \
    && apk add font-noto-georgian \
    && apk add font-noto-glagolitic \
    && apk add font-noto-gothic \
    && apk add font-noto-gujarati \
    && apk add font-noto-gurmukhi \
    && apk add font-noto-hebrew \
    && apk add font-noto-kannada \
    && apk add font-noto-kayahli \
    && apk add font-noto-khmer \
    && apk add font-noto-lao \
    && apk add font-noto-lisu \
    && apk add font-noto-malayalam \
    && apk add font-noto-mandaic \
    && apk add font-noto-myanmar \
    && apk add font-noto-nko \
    && apk add font-noto-olchiki \
    && apk add font-noto-oldturkic \
    && apk add font-noto-oriya \
    && apk add font-noto-osage \
    && apk add font-noto-osmanya \
    && apk add font-noto-shavian \
    && apk add font-noto-sinhala \
    && apk add font-noto-tamil \
    && apk add font-noto-telugu \
    && apk add font-noto-thaana \
    && apk add font-noto-thai \
    && apk add font-noto-tibetan \
    && apk add font-noto-tifinagh \
    && apk add font-noto-vai 
  
RUN apk add font-bitstream-speedo \
    && apk add font-bitstream-type1 \
    && apk add ttf-ubuntu-font-family\
    && apk add ttf-font-awesome \
    && apk add ttf-freefont \
    && apk add unifont \
    && apk add font-mutt-misc \
    && apk add font-bh-100dpi \
    && apk add font-bh-lucidatypewriter-100dpi \
    && apk add font-bh-ttf \
    && apk add font-bh-lucidatypewriter-75dpi \
    && apk add font-bh-type1  \
    && apk add font-bh-75dpi \
    && apk add font-croscore\
    && apk add font-vollkorn\
    && apk add ttf-opensans\
    && apk add ttf-cantarell \
    && apk add ttf-linux-libertine \
    && apk add ttf-inconsolata \
    && apk add font-schumacher-misc\
    && apk add font-cursor-misc\
    && apk add font-sun-misc\
    && apk add font-winitzki-cyrillic\
    && apk add font-isas-misc\
    && apk add font-jis-misc\
    && apk add font-dec-misc\
    && apk add font-arabic-misc\
    && apk add font-adobe-utopia-type1 \
    && apk add font-adobe-utopia-75dpi \
    && apk add font-adobe-utopia-100dpi 

   
RUN fc-cache -f

RUN apk --no-cache add msttcorefonts-installer fontconfig && \
    update-ms-fonts && \
    fc-cache -f

COPY --from=tomcat9 /usr/local/tomcat /usr/local/tomcat

ENTRYPOINT catalina.sh run
