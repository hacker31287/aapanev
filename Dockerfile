FROM ubuntu:22.04 ubuntu-base


RUN apt-get -qqy update \
    && apt-get autoclean \
    && apt-get autoremove
RUN apt-get update
RUN wget -O install.sh http://www.aapanel.com/script/install-ubuntu_6.0_en.sh && sudo bash install.sh aapanel
