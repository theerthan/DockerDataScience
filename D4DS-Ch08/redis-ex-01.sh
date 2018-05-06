#!/usr/bin/env bash

docker pull redis

CONTAINER=$(docker run -d redis)

docker exec $CONTAINER redis-cli ping

docker stop $CONTAINER

docker rm $CONTAINER



