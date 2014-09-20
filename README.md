#fig-yml

This is my (very infant) attempt at getting [edx](https://github.com/edx/edx-platform) running in a local fig development envrionment. 

## Contributions
Yes, please! As I'm wading through both fig and edx without any experience, any help is much appreciated.

## First, get Fig
Before you start, get fig up and running on your machine: http://www.fig.sh/install.html

## Next, get edX
You'll want to pull the latest version of edX from github

```
git clone https://github.com/edx/edx-platform.git edx-platform
```

## Build the image
This will take a very long time the first time you build the edx image. Once we have successfully built a highly stable docker image, I'll host it publically so this process is much quicker, but for now:

```
fig build
```

## Run!
Once the build process is complete, you're ready to run the local server:

```
fig up
```


