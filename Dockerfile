FROM ubuntu:20.04 as ubuntu-base


RUN apt-get -qqy update \
    && apt-get autoclean \
    && apt-get autoremove

#============================
# Utilities
#============================
FROM ubuntu-base as ubuntu-utilities
RUN apt-get update
RUN apt-get install ffmpeg -y
RUN apt-get -qqy update \
    && apt-get -qqy --no-install-recommends install \
        firefox htop terminator gnupg2 software-properties-common \
    && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && apt install -qqy --no-install-recommends ./google-chrome-stable_current_amd64.deb \
    && apt-add-repository ppa:remmina-ppa-team/remmina-next \
    && apt update \
    && apt install -qqy --no-install-recommends remmina remmina-plugin-rdp remmina-plugin-secret \
    && apt-add-repository ppa:obsproject/obs-studio \
    && apt update \
    && apt install -qqy --no-install-recommends obs-studio \
    && apt install unzip \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

# COPY conf.d/* /etc/supervisor/conf.d/


#============================
# GUI
#============================
FROM ubuntu-utilities as ubuntu-ui

