FROM debian:buster-slim

# File Author / Maintainer
LABEL maintainer=AGSPhoenix

ARG DEBIAN_FRONTEND=noninteractive
# Makes the apt-get process aware
# of the docker build process env
# so it doesn't complain as much

RUN \
# MAN folder needed for jre install
	mkdir -p \
		/usr/share/man/man1 \
		/sheep/cache \
	# Upgrade packages, install JRE, curl and blender deps
	&& apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y --no-install-recommends \
	default-jre-headless \
	curl \
	libglu1-mesa \
	libxi6 \
	libxrender1 \
	# needed for some older versions of Blender:
	libsdl1.2debian \
	libgl1-mesa-glx \
	# libglu1-mesa deps: #not manually specified; Debian maintainers are pretty good about not breaking this
	#	libxxf86vm1
	#	libxfixes3
	#	Dependency chain for both being
	#	libglu1-mesa -> libgl1 -> libglx0 -> libglx-mesa0
	# default-jre-headless (openjdk-11-jre-headless) deps:
	#	libfreetype6
	&& apt-get -y autoremove \
	&& apt-get -y clean \
	&& rm -rf \
		/var/lib/apt/lists/* \
		/tmp/*

ADD startrenderer.sh /sheep/startrenderer.sh
ADD startrenderer.sh /sheep/initrenderer.sh
RUN chmod +x /sheep/initrenderer.sh

WORKDIR /sheep

ENV user_name ""
ENV user_password ""
ENV cpu "0"
ENV user_UID "1000"
ENV user_GID "1000"
ENV extra_arg ""

CMD ./initrenderer.sh
