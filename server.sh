#!/bin/bash
docker build -t go_desktop . && \
# docker run --device=/dev/tty0:rw -it --rm --gpus all \
docker run --privileged -it --rm --gpus all \
  -p 8081:8081 \
  -p 5900:5900 \
  -e VNCPASS=pass \
  -e RESOLUTION=1920x1080 \
  -v ${HOME}/container_home:/home/go \
  -v ${HOME}:/home/go/host_home \
  -v /mnt/HDD:/mnt/HDD \
  -u $(id -u):$(id -g) \
  -e USER=go \
  -e PASSWD=go \
  --name go_desktop go_desktop
  # -v $HOME/hoge:/hoge:ro \
