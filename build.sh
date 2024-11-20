#!/bin/bash

get_parent() {
    local dir="$(cd "$(dirname "$0")"; pwd)"
    for ((i=0; i<$1; i++)); do dir="$(dirname "$dir")"; done
    echo "$dir"
}

TAG="deepcv/wg-easy:latest"

cd $(get_parent 0)
docker build \
    --pull \
    --no-cache \
    -f ./Dockerfile \
    -t $TAG \
    . && \
docker push $TAG
