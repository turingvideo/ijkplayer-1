#!/bin/bash

set -e

VERSION=t0.10.0

RELEASE_VERSION=${VERSION}

SDK_BIN_URL=https://github.com/turingvideo/ijkplayer-for-flutter/releases/download/${VERSION}/ijkplayer-full64.aar

BUILD_DIR=build
mkdir -p ${BUILD_DIR}
cd ${BUILD_DIR}

echo "Downloading ijkplayer ${VERSION} binary for android."
curl -L -O ${SDK_BIN_URL}

mvn install:install-file \
    -Dfile=ijkplayer-full64.aar \
    -Dpackaging=aar \
    -Dversion=${RELEASE_VERSION} \
    -DgroupId=com.github.turingvideo \
    -DartifactId=android
