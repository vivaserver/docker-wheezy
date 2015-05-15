FROM debian:wheezy
MAINTAINER cristian.arroyo@vivaserver.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update
RUN apt-get -qq install apt-utils
RUN apt-get -qq install locales

# ref. https://github.com/rocker-org/rocker/issues/19#issuecomment-58311985
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales
RUN update-locale en_US.UTF-8

ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN apt-get -qq clean
