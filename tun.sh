#!/bin/bash
mkdir src/data/
docker cp pg_container:src/data/BBCnews.csv src/data/
