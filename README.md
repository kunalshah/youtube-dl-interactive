Docker version to run youtube-dl interactively.


### Credits

1. [youtube-dl](https://github.com/ytdl-org/youtube-dl) 
2. [youtube-dl-interactive](https://github.com/synox/youtube-dl-interactive)


### How to use this docker image

The image uses `/data` volume where videos will be stored, so the user will need provide the folder that would be mapped to `/data`

For example, 
to download the youtube video `https://www.youtube.com/watch?v=37vz9Jdw5A8` and store it in `/Users/kunalshah/Downloads/videos` folder:

```
docker run \
--rm \
-it \
-v /Users/kunalshah/Downloads/videos:/data \
kunalshah/youtube-dl-interactive:latest \
https://www.youtube.com/watch?v=37vz9Jdw5A8
```


### youtube-dl-interactive usage
For youtube-dl-interactive usage information, see [youtube-dl-interactive repo](https://github.com/synox/youtube-dl-interactive) or [youtube-dl-interactive package on npm](https://www.npmjs.com/package/youtube-dl-interactive)


### Issues
If there's an problem running this docker image, please report issue [here](https://github.com/kunalshah/youtube-dl-interactive/issues)
