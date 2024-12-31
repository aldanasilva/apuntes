
### How to run `rocker/rstudio`

```console
$ docker container run --rm --detach \
     --publish 8787:8787 \
     -v /home/andresaldana/Documents/rstudio-server:/home/rstudio \
     -e DISABLE_AUTH=true \
     rocker/rstudio
```

###### References:
* https://hub.docker.com/r/rocker/rstudio

### Use of `rmdformats`

This works in html, and an example is below

```yaml
---
title: "Untitled"
output:
  rmdformats::downcute:
    downcute_theme: "chaos"
date: '2022-05-27'
---
```



