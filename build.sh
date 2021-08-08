#!/bin/bash
# Usage: ./build.sh os arch
# example: ./build.sh linux arm64
# matrix from: go tool dist list

#set -xe
set -e

OS="linux"
if [ ! -z $1 ]; then
  OS=$1
fi

ARCH="amd64"
if [ ! -z $2 ]; then
  ARCH=$2
fi

PARAMS=""
if [ $OS == "linux" ] && [ $ARCH == "386" ]; then
    PARAMS="GO386=softfloat"
fi

#FILE="main_${OS}_${ARCH}"
FILE="hello_1.0-1_amd64/usr/local/bin/hello"
CMD="GOOS=$OS GOARCH=$ARCH $PARAMS go build -o $FILE"
echo $CMD
eval $CMD

test -e $FILE
file $FILE

