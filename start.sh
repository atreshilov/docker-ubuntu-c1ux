#!/bin/bash
set -e
docker compose build
docker compose run --rm --name c1ux ubuntu-c1ux /bin/bash
