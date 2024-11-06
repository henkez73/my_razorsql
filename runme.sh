#!/bin/bash

docker build --platform linux/amd64 -t razorsql .
docker run --rm \
    --name my_razorsql \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    razorsql &

sleep 5

for f in data/*.txt; do docker cp $f my_razorsql:/home/developer/.razorsql/data/; done
