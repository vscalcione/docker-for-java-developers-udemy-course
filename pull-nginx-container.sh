#!/bin/bash

CONTAINER_NAME=docker-nginx
PATH=$HOME/docker-nginx/html

docker run --name $CONTAINER_NAME -p 80:80 -d -v $PATH:/usr/share/nginx/html nginx

