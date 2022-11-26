# RebornOS-ARM-Docker

A Docker Container for RebornOS ARM64

The docker image is uploaded at https://hub.docker.com/r/rebornos/rebornos-arm

The `build.sh`, `run.sh`, and `build_and_run.sh` scripts are self explanatory. They build an image and run the container using the local `Dockerfile`.

## Using the image from Docker Hub

> **Note:** The container is already configured to additionally start a shell in the `/home/rebornos-arm-shared` directory (within the container)

To run this container while mounting a custom local directory `~/rebornos-arm-shared` (on your host computer) for use as `/home/rebornos-arm-shared` (within the container), it is convenient to make an executable script that has the following contents:
```sh
#!/usr/bin/env sh

docker pull rebornos/rebornos-arm:latest
mkdir -p ~/rebornos-arm-shared

xhost +local:root \
    && docker run \
        --net=host \
        --ipc=host \
        --pid=host \
        --privileged=true \
        --volume /tmp/.X11-unix:/tmp/.X11-unix \
        --volume ~/rebornos-arm-shared:/home/rebornos-arm-shared \
        --env DISPLAY=${DISPLAY} \
        --interactive \
        --tty \
        --rm \
        rebornos/rebornos-arm:latest

xhost -local:root
```
Otherwise just run the above commands in the same order, without the `#!` line

## DistroBox Image Creation 

When creating an image through *distrobox-create*, add an extra argument: 
```sh
--pre-init-hooks "sh /usr/bin/init-rebornos-arm-docker.sh"
```

