Run youtube-dl interactively through Docker.

To reduce the size, this image is based on Alpine now. Current image size is 198 MB compared to 967 MB of previous version based on Debian.


### Credits

1. [youtube-dl](https://github.com/ytdl-org/youtube-dl) 
2. [youtube-dl-interactive](https://github.com/synox/youtube-dl-interactive)


### How to use this docker image

The image uses `/data` folder as a volume where videos will be stored. Hence the user needs to provide the folder that would be mapped to `/data`

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


### Source of this image

See https://github.com/kunalshah/youtube-dl-interactive


### Issues

If the problem occurs while running this docker image, please report issue [here](https://github.com/kunalshah/youtube-dl-interactive/issues)
