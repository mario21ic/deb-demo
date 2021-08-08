#!/bin/bash

docker run --name test-deb -d --platform=linux/amd64 -v $PWD:/app ubuntu:16.04 sleep 8000

docker exec -ti test-deb dpkg -i /app/hello_1.0-1_amd64.deb
docker exec -ti test-deb which hello
docker exec -ti test-deb hello

docker exec -ti test-deb apt-get remove --yes hello

docker rm -f test-deb


