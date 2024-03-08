#!/bin/bash

# remove running containers

DOCKER_USER=jamesolawlor
docker stop $(docker ps -q)
docker rm $(docker ps -aq)

# create a network

docker network create task1-network

#create a volume

docker volume create new-volume

# build flask and mysql

docker build -t $DOCKER_USER/task2-db db
docker build -t $DOCKER_USER/task2-flask-app flask-app
docker build -t $DOCKER_USER/task2-nginxp nginx

# run mysql container

docker run -d --network task1-network --name mysql $DOCKER_USER/task2-db 
    
# run flask container

docker run -d --network task1-network -e MYSQL_ROOT_PASSWORD=password --name flask-app $DOCKER_USER/task2-flask-app

# run the nginx container

docker run -d --network task1-network --name nginx -p 80:80 --mount type=bind,source=$(pwd)/nginx/nginx.conf,target=/etc/nginx/nginx.conf $DOCKER_USER/task2-nginxp 

# shpw running containers

docker ps -a
