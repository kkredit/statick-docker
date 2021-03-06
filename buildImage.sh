#!/usr/bin/env bash

# File: buildimage.sh
# Author: Kevin Kredit
# License: Creative Commons Zero v1.0 Universal
# Description:
#   Script to create the Statick Docker image

BASE_NAME="statick"
IMAGE_NAME="$BASE_NAME:$(cd statick && git rev-parse HEAD | head -c8)"
IMAGE_LATEST="$BASE_NAME:latest"

if [[ ! -f statick/install.txt ]]; then
    git submodule init
    git submodule update --init --force --remote
fi

docker build -t $IMAGE_NAME \
             --build-arg USER_UID=$(id -u) \
             --build-arg USER_GID=$(id -g) \
             -f statick.dockerfile \
             .

docker tag $IMAGE_NAME $IMAGE_LATEST
