#!/usr/bin/env bash

docker build -t gsl docker

docker run -v `pwd`:/home gsl gcc -I /usr/include/ -L /usr/lib/ -lgsl -lgslcblas /home/src/bessel.c -o /home/bin/bessel

docker run -v $(pwd):/home gsl /home/bin/bessel