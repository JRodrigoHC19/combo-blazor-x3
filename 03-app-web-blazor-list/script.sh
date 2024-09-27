#!bin/bash

# Variables
ID="app-blazor"

# Steps
docker build -t $ID .
docker run -d --rm -p 8083:8080 $ID

# sleep 20
# docker rmi $ID