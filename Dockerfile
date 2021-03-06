# Build a "vivaserver/wheezy" image from this Dockerfile using:
#   $ docker build . -t vivaserver/wheezy

FROM debian:wheezy
MAINTAINER cristian.arroyo@vivaserver.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update && apt-get -qq install apt-utils locales && apt-get -qq clean && rm -f /var/lib/apt/lists/*_*

# ref. https://github.com/rocker-org/rocker/issues/19#issuecomment-58311985
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales
RUN update-locale en_US.UTF-8

ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
