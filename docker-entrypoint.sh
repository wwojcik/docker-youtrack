#!/bin/sh

# Redirect stderr so everything ends up in the log file
exec 2>&1

exec java \
	-XX:MaxPermSize=250m -Xmx1g \
	-Duser.home=/var/lib/youtrack \
	-Djavax.net.ssl.trustStore=/etc/ssl/certs/java/cacerts -Djavax.net.ssl.trustStorePassword=changeit \
	-Djetbrains.youtrack.disableBrowser=true -Djetbrains.youtrack.enableGuest=false \
	-Djetbrains.mps.webr.log4jPath=/etc/youtrack/log4j.xml -Djava.awt.headless=true \
	-jar /usr/local/youtrack/youtrack.jar 8080  2>&1