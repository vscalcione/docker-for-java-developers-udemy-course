#!/bin/bash

docker stop $(docker ps -aq)
echo 'All docker-containers are stopped now'

docker rmi -f $(docker images -q)
echo 'All docker-containers are removed completely now'
