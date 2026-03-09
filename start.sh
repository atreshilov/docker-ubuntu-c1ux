#!/bin/bash
set -e
#docker compose create
#docker start c1ux
#DOCKER_CLI_HINTS=0 docker exec -it c1ux /bin/bash
#docker stop c1ux
#docker rm c1ux

docker compose build
docker compose run --rm --name c1ux ubuntu-c1ux /bin/bash
