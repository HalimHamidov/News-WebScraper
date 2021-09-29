#!/bin/bash
docker-compose up -d --build
docker exec -ti pg_container bash menu.sh
