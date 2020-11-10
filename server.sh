#!/bin/bash
docker build -t sim . && \
# docker run --device=/dev/tty0:rw -it --rm --gpus all \
docker run --privileged -it --rm --gpus all \
  -p 8081:8081 \
  -p 5900:5900 \
  -e VNCPASS=pass \
  -e RESOLUTION=1280x720 \
  -v ${HOME}:/home/ubuntu \
  -v /mnt/HDD:/mnt/HDD \
  -u $(id -u):$(id -g) \
  -e USER=ubuntu \
  -e PASSWD=ubuntu \
  --name sim sim
  # -v $HOME/hoge:/hoge:ro \
