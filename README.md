# A simple dockerized SheepIt render farm client

After being appalled by @dapor2000's monstrous [600 MB SheepIt client](https://hub.docker.com/r/dapor/docker_sheepit_renderfarm/) image, I took it upon myself to build a somewhat more lightweight client, and after a few hours, came up with this Debian-based image that is a third the size, acts as a drop-in replacement, and is probably a smidgen faster too.

There's probably a little more room for fat trimming, since this was adapted from an old Ubuntu VM setup script, but I'm satisfied with where things are currently.

## Instructions
Same as @dapor2000's, just swap out your username and password.

```
docker run -d \
 --name "sheep_it" \
 -e user_name=XXXXXX \
 -e user_password=XXXXX \
 agsphoenix/sheepit-docker:latest
```

You can also specify the `cpu` variable to override autodetection; like `-e cpu=4`.

## Extra bits
[Docker Hub page](https://hub.docker.com/r/agsphoenix/sheepit-docker/)

[SheepIt client GitHub repo](https://github.com/laurent-clouet/sheepit-client)  
[SheepIt site](https://www.sheepit-renderfarm.com/)
