FROM debian:stretch-slim

# File Author / Maintainer
MAINTAINER AGSPhoenix

RUN \
# MAN folder needed for jre install
     mkdir -p /usr/share/man/man1 \
  && mkdir -p /sheep/cache \
# Install JRE and curl
  && apt-get update \
  && apt-get install -y --no-install-recommends \
	openjdk-8-jre-headless \
	curl \

#Blender dependencies
	libxxf86vm1 \
	libxfixes3

ADD startrenderer.sh /sheep/startrenderer.sh
RUN chmod +x /sheep/startrenderer.sh

WORKDIR /sheep

ENV user_name ""
ENV user_password ""
ENV cpu "0"

CMD ./startrenderer.sh
