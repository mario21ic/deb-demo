#!/bin/bash

set -e

ARCH=$1

rm -rf hello_1.0-1_$ARCH.deb hello_1.0-1_$ARCH

cp -rf hello_1.0-1_ARCH hello_1.0-1_$ARCH
cp -f main_$OS_$ARCH hello_1.0-1_$ARCH/usr/local/bin/hello
sed -i "s/ARCH/$ARCH/g" hello_1.0-1_$ARCH/DEBIAN/control

dpkg-deb --build --root-owner-group hello_1.0-1_$ARCH
