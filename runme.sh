#!/bin/sh

docker build --platform linux/amd64 -t razorsql .
docker run --rm \
    --name my_razorsql \
    -p 5800:5800 \
    -p 5900:5900 \
    razorsql &

sleep 5

for f in data/*.txt; do docker cp $f my_razorsql:/home/developer/.razorsql/data/; done
