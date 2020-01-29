Docker version to run youtube-dl interactively.

Credits:
```
1. youtube-dl (https://github.com/ytdl-org/youtube-dl) 
2. youtube-dl-interactive (https://github.com/synox/youtube-dl-interactive)
```

How to use:

The image uses `/data` volume where videos will be stored, so the user will need provide the folder that would be mapped to `/data`

For example, the command to download the youtube video `https://www.youtube.com/watch\?v\=5ADSoHm4NX0` and store it in `/Users/kunalshah/Downloads/videos` folder:

```
docker run --rm -u $(id -u):$(id -g) -it -v /Users/kunalshah/Downloads/videos:/data kunalshah/youtube-dl-interactive:latest https://www.youtube.com/watch\?v\=5ADSoHm4NX0
```

