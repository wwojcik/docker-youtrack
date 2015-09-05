FROM gliderlabs/alpine:latest

MAINTAINER Wojciech Wójcik <wojtaswojcik@gmail.com>

ENV YOUTRACK_VERSION=6.5.16433 \
    JAVA_HOME=/usr/lib/jvm/java-1.7-openjdk \
    TIMEZONE=Europe/Warsaw

RUN apk --update add openjdk7-jre-base openssl unzip tzdata\
    && wget -O /tmp/youtrack.zip http://download.jetbrains.com/charisma/youtrack-$YOUTRACK_VERSION.zip \
    && mkdir -p /opt/youtrack \
    && unzip /tmp/youtrack.zip -d /opt/youtrack  \
    && rm -rf /tmp/youtrack.zip  /var/cache/apk/* \
    && cp /usr/share/zoneinfo/$TIMEZONE /etc/localtime \
    && echo "$TIMEZONE" >  /etc/timezone

EXPOSE 8080
VOLUME ["/opt/youtrack/conf", "/opt/youtrack/data"]
ENTRYPOINT ["/opt/youtrack/bin/youtrack.sh", "start"]
CMD [""]
