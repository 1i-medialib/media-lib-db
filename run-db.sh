#!/bin/zsh

DOCKER_NAME=medialibdb
DB_HOST_PORT=35432

DB_PATH=$(pwd)/db

docker run \
    --restart unless-stopped \
    --name ${DOCKER_NAME} \
    -p ${DB_HOST_PORT}:5432 \
    -v ${DB_PATH}:/var/lib/postgresql/data \
    --user $(id -u):$(id -g) \
    -d \
    medialib/pgdb

exit 0
