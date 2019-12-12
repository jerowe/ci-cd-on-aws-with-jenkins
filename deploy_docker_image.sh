#!/usr/bin/env bash
set -x -e

DOCKER_COMPOSE_PREFIX=$(basename $(pwd))
# If you are using quay you need to prefix the upload with quay.io.
# If you are using dockerhub you can just use your username.
DOCKER_USER="user"
DOCKER="quay.io/"
DOCKER_UPLOAD="${DOCKER}${USER}"

# Tag the docker images
docker tag ${DOCKER_COMPOSE_PREFIX}_flask-app-server ${DOCKER_UPLOAD}/flask-app-server:latest
docker push ${DOCKER_UPLOAD}/flask-app-server:latest
