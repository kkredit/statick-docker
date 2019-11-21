#!/usr/bin/env bash

# File : runcontainer.sh
# Author: Kevin Kredit
# License: Creative Commons Zero v1.0 Universal
# Description:
#   Script to run the Statick image

RUN_FLAGS="--rm -v $(pwd):/host -u $(id -u):$(id -g) --hostname container"

if [[ $# > 0 ]]; then
    docker run $RUN_FLAGS statick:latest bash -c "cd /host && $*"
else
    RUN_FLAGS+=" -it"
    docker run $RUN_FLAGS statick:latest
fi
