#!/bin/bash

ARCH="amd64"
if [ ! -z $1 ]; then
  ARCH=$1
fi

FILE="main_${ARCH}"

echo "## Making DEB"
docker run --rm --platform=linux/$ARCH -ti -v $PWD:/app -w /app ubuntu:18.04 ./make-deb.sh $ARCH

echo "## Done"
file $FILE

