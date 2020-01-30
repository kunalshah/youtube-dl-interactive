# Base this image on specific version of node to lock down the running version of node.js against youtube-dl-interactive
FROM node:13-alpine

RUN apk update 
RUN apk add --update --no-cache curl python icu-libs

# Install youtube-dl from the sources. See https://github.com/ytdl-org/youtube-dl#installation
RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl \
    && chmod a+rx /usr/local/bin/youtube-dl \
    && echo 'youtube-dl version is' `youtube-dl --version`

# Install specific version of youtube-dl-interactive from npm because this
#   Dockerfile will to be updated when new version of youtube-dl-interactive is released
# See https://www.npmjs.com/package/youtube-dl-interactive
RUN npm install --g --cache /tmp/empty-cache youtube-dl-interactive@0.1.0 \
    && rm -rf /tmp/empty-cache \
    && echo 'youtube-dl-interactive version is' `youtube-dl-interactive --version`

# As youtube-dl-interactive is containerized, docker image can't be updated. Hence, disable update check for both npm and youtube-dl-interactive
# See https://www.npmjs.com/package/update-notifier
RUN echo '{ "optOut": true, "lastUpdateCheck": 1580410864966 }' >  ~/.config/configstore/update-notifier-npm.json \
    && echo '{ "optOut": true, "lastUpdateCheck": 1580410864966 }' > ~/.config/configstore/update-notifier-youtube-dl-interactive.json

# Set work directory for youtube-dl
WORKDIR /data

ENTRYPOINT [ "youtube-dl-interactive"]
