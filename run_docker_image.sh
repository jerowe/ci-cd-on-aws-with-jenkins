#!/usr/bin/env bash

#build the image if it's not already built ;-)
#docker build -t python_flask_app flask_app

# With COPY
docker run \
    -p 5000:5000 \
    python_flask_app:latest

# With Volumes
docker run \
    -p 5000:5000 \
    -v flask_app:/home/flask/flask_app:Z \
    python_flask_app:latest
