xhost +local:docker

sudo docker run --privileged -it \
           -e NVIDIA_DRIVER_CAPABILITIES=all \
           -e NVIDIA_VISIBLE_DEVICES=all -e DISPLAY=$DISPLAY\
           --volume=./:/home/catkin_ws/src \
           --volume=/tmp/.X11-unix:/tmp/.X11-unix:rw \
           --net=host \
           --ipc=host \
           --shm-size=1gb \
           --name=lvi-sam \
           --env="DISPLAY=$DISPLAY" \
         lvi:v1 /bin/bash

