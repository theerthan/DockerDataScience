#!/usr/bin/env bash

docker volume create --name redis-db

docker volume ls

CONTAINER1=$(docker run -d --name redis-c -v redis-db:/data redis)

docker exec $CONTAINER1 redis-cli incr mycounter

docker exec $CONTAINER1 redis-cli incr mycounter

docker exec $CONTAINER1 redis-cli incr mycounter

docker stop $CONTAINER1

docker rm $CONTAINER1

CONTAINER2=$(docker run -d --name redis-c -v redis-db:/data redis)

docker exec $CONTAINER2 redis-cli incr mycounter

docker stop $CONTAINER2

docker rm $CONTAINER2
