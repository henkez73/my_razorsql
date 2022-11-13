#!/bin/bash

xhost +"local:docker@"

sleep 1

docker run --rm \
    --name my_razorsql \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    henkez/my_razorsql:latest &

sleep 5

for f in data/*.txt; do docker cp $f my_razorsql:/home/developer/.razorsql/data/; done
