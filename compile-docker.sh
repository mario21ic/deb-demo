#!/bin/bash

rm -f main

echo "## Compiling"
docker run --rm --platform=linux/amd64 -ti -v $PWD:/app -w /app golang:1.16-alpine go build -a -o main

echo "## Done"
file main
