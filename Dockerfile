# Use base image that has curl, python and node.js
FROM node:buster

# Install youtube-dl from the sources. See https://github.com/ytdl-org/youtube-dl#installation
RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl

# Install youtube-dl from the source. See https://github.com/ytdl-org/youtube-dl#installation
RUN npm install --verbose --g youtube-dl-interactive
RUN youtube-dl --version

# Set environemnt variable to function correctly on utf-8 file names
RUN export LC_ALL=en_US.UTF-8

# Set work directory for youtube-dl
WORKDIR /data

ENTRYPOINT [ "youtube-dl-interactive" ]
