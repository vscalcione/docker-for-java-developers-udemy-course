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

<details>
  <summary>Springboot Mongodb Demo Application</summary>
  
  ## Run application
  Run this command to startup your Springboot application with mongodb integration 
  ```bash
  $ mvn spring-boot:run
  ```

  ## Run docker container
  After this, run the command that view below to start mongodb docker container:
  ```bash
  $ docker run -p 27017:27017 -d mongo
  ```

  And show the relative log with the command:
  ```bash
  $ docker logs -f <container-id>
  ```
</details>
