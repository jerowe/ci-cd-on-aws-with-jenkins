#!/usr/bin/env bash

set -x -e

gunicorn --workers=2 \
    --bind=0.0.0.0:5000 --keep-alive=2000 \
    --timeout=2000 --log-level=debug  --reload \
    flask_app:app
