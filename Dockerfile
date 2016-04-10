FROM debian:8

# File Author / Maintainer
MAINTAINER AGSPhoenix

RUN  apt-get update -y \
  && apt-get install -y --no-install-recommends \
   openjdk-7-jre-headless \
   curl \
#Blender dependencies
   libxxf86vm1 \
   libxi6

RUN mkdir -p /sheep/cache

ADD startrenderer.sh /sheep/startrenderer.sh
RUN chmod +x /sheep/startrenderer.sh

WORKDIR /sheep

ENV user_name ""
ENV user_password ""
ENV cpu "0"

CMD ./startrenderer.sh
