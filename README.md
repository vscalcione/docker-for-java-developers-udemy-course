## docker-for-java-developers-udemy-course

This is a sample repository on usage of docker fundamentals concepts

![docker-logo](https://img.icons8.com/color/96/000000/docker.png)
![java-logo](https://img.icons8.com/color/96/000000/java-coffee-cup-logo.png)
![spring-framework-logo](https://img.icons8.com/color/96/000000/spring-logo.png)
![linux-logo](https://img.icons8.com/color/96/000000/linux.png)
![debian-logo](https://img.icons8.com/color/96/000000/debian.png)

### Some commands used

```bash
#!/bin/bash

# Remove Docker containers

docker stop $(docker ps -aq)
echo 'All containers are stopped now'

docker rmi -f $(docker images -q)
echo 'All containers are removed completely now'

# Pull Nginx Container

CONTAINER_NAME=docker-nginx
PATH=$HOME/docker-nginx-html

docker run --name $CONTAINER_NAME -p 80:80 -d -v $PATH:/usr/share/nginx/html nginx
```

## Springboot Mongodb Demo Application
```bash

# Run this command to starup your Springboot application with mongodb integration
$ mvn spring-boot:run

# Run these commands to start mongodb docker container and view container's log
$ docker run -p 27017:27017 -d mongo
$ docker logs -f <container-id>

# Add storage support
$ docker run -p 27017:27017 -v <path-of-folder>/docker-mongo-data:/data/db -d mongo
```

## RabbitMQ & MySQL
```bash

# Run this command to start rabbitmq's docker container
$ docker run -d --hostname vscalcione-rabbitmq --name rabbitmq-custom -p 8080:15672 -p 5671:5671 -p 5672:5672 rabbitmq:3-management

# Run this command to start mysql's docker container
$ docker run --name mysql-custom -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -v <path-of-your-folder>/mysql-data:/var/lib/mysql -p 3306:3306 -d mysql
```
