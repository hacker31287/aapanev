FROM ubuntu:latest as ubuntu-base


RUN apt-get -qqy update \
    && apt-get autoclean \
    && apt-get autoremove
RUN apt-get update
RUN wget -O http://www.aapanel.com/script/install-ubuntu_6.0_en.sh \
    && sh install-ubuntu_6.0_en.sh aapanel
