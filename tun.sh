#!/bin/bash
rm -r src/data/ && mkdir src/data/
docker cp pg_container:src/data/BBCnews.csv src/data/
