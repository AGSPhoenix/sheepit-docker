FROM debian:7

# File Author / Maintainer
MAINTAINER AGSPhoenix

RUN  apt-get update -y \
  && apt-get install -y --no-install-recommends \
   openjdk-7-jre-headless \
   libxxf86vm1 \
#Already pulled in by the JRE on Debian, but not on Ubuntu.
   libxi6

RUN mkdir -p /sheep/cache

ADD https://www.sheepit-renderfarm.com/media/applet/client-latest.php /sheep/sheepit.jar

WORKDIR /sheep

ENV user_name ""
ENV user_password ""
ENV cpu "1"

CMD java -jar /sheep/sheepit.jar -ui text -login $user_name -password $user_password -cores $cpu -cache-dir /sheep/cache
