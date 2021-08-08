#!/bin/bash
# Usage: ./build.sh arch
# example: ./build.sh arm64|amd64
# matrix from: go tool dist list

set -e

ARCH="amd64"
if [ ! -z $1 ]; then
  ARCH=$1
fi

PARAMS=""
if [ $ARCH == "386" ]; then
    PARAMS="GO386=softfloat"
fi

FILE="main_${ARCH}"
#FILE="hello_1.0-1_$ARCH/usr/local/bin/hello"
CMD="GOOS=linux GOARCH=$ARCH $PARAMS go build -o $FILE"
echo $CMD
eval $CMD

test -e $FILE
#file $FILE

