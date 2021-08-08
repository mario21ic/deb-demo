#!/bin/bash

ARCH="amd64"
if [ ! -z $1 ]; then
  ARCH=$1
fi

FILE="hello_1.0-1_$ARCH.deb"

docker run --name test-deb -d --platform=linux/$ARCH -v $PWD:/app ubuntu:18.04 sleep 8000

docker exec -ti test-deb dpkg -i /app/$FILE
docker exec -ti test-deb which hello
docker exec -ti test-deb hello

docker exec -ti test-deb apt-get remove --yes hello

docker rm -f test-deb


