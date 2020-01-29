# Use base image that has curl, python and node.js
FROM node:13-buster

# Update packages 
RUN apt-get update

# Set locale because youtube-dl complains if locale is not set in LC_ALL environment variable
# See https://github.com/ytdl-org/youtube-dl/issues/21057 and 
# https://daten-und-bass.io/blog/fixing-missing-locale-setting-in-ubuntu-docker-image/
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y locales \
    && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8 
ENV LC_ALL en_US.UTF-8

# Install youtube-dl from the sources. See https://github.com/ytdl-org/youtube-dl#installation
RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl \
    && chmod a+rx /usr/local/bin/youtube-dl \
    && echo 'youtube-dl version is' `youtube-dl --version`

# Install specific version of youtube-dl-interactive from npm because we want to update the Dockerfile if there's package update in the npmjs.com
# See https://www.npmjs.com/package/youtube-dl-interactive
ARG YOUTUBE_DL_INTERACTIVE_VERSION=0.1.0
RUN npm install --verbose --g youtube-dl-interactive@$YOUTUBE_DL_INTERACTIVE_VERSION \
    && echo 'youtube-dl-interactive version is' `youtube-dl-interactive --version`

# As youtube-dl-interactive is containerized, docker image can't be updated. Hence, disable update check for both npm and youtube-dl-interactive
# See https://www.npmjs.com/package/update-notifier
RUN echo '{ "optOut": true, "lastUpdateCheck": 1580281042 }' >  ~/.config/configstore/update-notifier-npm.json \
    && echo '{ "optOut": true, "lastUpdateCheck": 1580281042 }' > ~/.config/configstore/update-notifier-youtube-dl-interactive.json

# Set work directory for youtube-dl
WORKDIR /data

ENTRYPOINT [ "youtube-dl-interactive"]
