#!/bin/bash

# build
apk --update add git build-base
git clone https://github.com/sass/sassc
cd sassc
git clone https://github.com/sass/libsass
SASS_LIBSASS_PATH=/tmp/sassc/libsass make

# install
mv bin/sassc /usr/bin/sass
ln -sf /usr/bin/sass /usr/bin/sassc

# cleanup
cd /
rm -rf /sassc
apk del git build-base
apk add libstdc++ # sass binary still needs this because of dynamic linking.
rm -rf /var/cache/apk/*
