FROM gliderlabs/alpine:latest

MAINTAINER Wojciech Wójcik <wojtaswojcik@gmail.com>

ENV YOUTRACK_VERSION=6.5.16367 \
    JAVA_HOME=/usr/lib/jvm/java-1.7-openjdk \
    TIMEZONE=Europe/Warsaw

RUN apk --update add openjdk7-jre-base openssl unzip tzdata\
    && mkdir -p /usr/local/youtrack \
    && mkdir -p /var/lib/youtrack \
    && mkdir -p /etc/youtrack \
    && wget https://download.jetbrains.com/charisma/youtrack-$YOUTRACK_VERSION.jar -O /usr/local/youtrack/youtrack-$YOUTRACK_VERSION.jar \
    && ln -s /usr/local/youtrack/youtrack-$YOUTRACK_VERSION.jar /usr/local/youtrack/youtrack.jar  \
    && rm -rf /var/cache/apk/* \
    && cp /usr/share/zoneinfo/$TIMEZONE /etc/localtime \
    && echo "$TIMEZONE" >  /etc/timezone

EXPOSE 8080
COPY etc/log4j.xml /etc/youtrack/
COPY docker-entrypoint.sh /
VOLUME /var/lib/youtrack
ENTRYPOINT ["sh", "/docker-entrypoint.sh"]
CMD [""]