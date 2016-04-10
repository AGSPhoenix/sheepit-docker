FROM debian:8

# File Author / Maintainer
MAINTAINER AGSPhoenix

RUN  apt-get update -y \
  && apt-get install -y --no-install-recommends \
   openjdk-7-jre-headless \
   libxxf86vm1 \
   wget \
#Already pulled in by the JRE on Debian, but not on Ubuntu.
   libxi6

RUN mkdir -p /sheep/cache

ADD startrenderer.sh /sheep/startrenderer.sh
RUN chmod +x /sheep/startrenderer.sh

WORKDIR /sheep

ENV user_name ""
ENV user_password ""
ENV cpu "1"

CMD ./startrenderer.sh
