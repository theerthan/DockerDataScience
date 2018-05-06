#!/usr/bin/env bash

docker run -d --name redis-c -v redis-db:/data redis

docker run -d -p 8888:8888 -v $(pwd):/home/jovyan --link redis-c jupyter/scipy-notebook