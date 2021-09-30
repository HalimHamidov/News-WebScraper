#!/bin/bash
docker-compose down -v
docker rm -f $(docker ps -a -q)
docker rmi -f $(docker images -a -q)
docker volume rm $(docker volume ls -q)
docker system prune -a

# Shutting down docker, deleting images, volumes, Removing All Unused Docker Objects
