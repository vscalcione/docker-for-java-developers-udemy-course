#!/bin/bash

## Pulling MongoDB docker container
docker run mongo


## Start Contaier instance
docker run --name mongo-docker -d mongo


## Start Container instance with port mapping
docker run -p 27017:27017 -d mongo
