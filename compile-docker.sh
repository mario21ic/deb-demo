#!/bin/bash

ARCH="amd64"
if [ ! -z $1 ]; then
  ARCH=$1
fi

FILE="main_${ARCH}"

rm -f $FILE

echo "## Compiling"
docker run --rm --platform=linux/amd64 -ti -v $PWD:/app -w /app golang:1.16 ./compile.sh $ARCH

echo "## Done"
file $FILE
