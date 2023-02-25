#!/bin/bash

docker compose run --rm app moonc .
docker compose up

# docker run \
#   -p 9090:8080 \
#   --mount type=bind,source="$(pwd)"/src,target=/app \
#   -w /app \
#   --rm -it lapis:1.12.0-1 lapis server