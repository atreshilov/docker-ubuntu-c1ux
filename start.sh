#!/bin/bash

if [ ! -f ./_temp_/my_sparse.img ]; then
	echo "ERROR: ./_temp_/my_sparse.img is not accessible"
	exit 1
fi

set -e
docker compose build
docker compose run --rm --name c1ux ubuntu-c1ux /bin/bash
