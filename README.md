Rebase Debian Stretch-slim and JRE8 
https://hub.docker.com/r/luxaeterna/sheepit-docker
Will be removed as soon as the changes are merged into AGSPhoenix's Repo, enjoy with care ;)



# A simple dockerized SheepIt render farm client

After being appalled by @dapor2000's monstrous [1.2 GB SheepIt client](https://hub.docker.com/r/dapor/docker_sheepit_renderfarm/) image, I took it upon myself to build a somewhat more lightweight client, and after a few hours, came up with this Debian-based image that is a fifth the size, acts as a drop-in replacement, and auto-updates the client on container startup.

There's probably a little more room for fat trimming, since this was adapted from an old Ubuntu VM setup script, but I'm satisfied with where things are currently.

## Instructions
Pretty similar to @dapor2000's, just swap out your username and password.

```
docker run -d \
 --name "sheepit" \
 -e user_name=XXXXXX \
 -e user_password=XXXXXX \
 agsphoenix/sheepit-docker:latest
```

You can also specify the `cpu` variable to override autodetection; like `-e cpu=4`.

## Extra bits
[Docker Hub page](https://hub.docker.com/r/agsphoenix/sheepit-docker/)  
[GitHub page](https://github.com/AGSPhoenix/sheepit-docker)

[SheepIt client GitHub repo](https://github.com/laurent-clouet/sheepit-client)  
[SheepIt site](https://www.sheepit-renderfarm.com/)
