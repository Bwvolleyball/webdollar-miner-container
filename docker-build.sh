#!/usr/bin/env bash

WEBDOLLAR_SHA=$( curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/webdollar/node-webdollar/commits/master/status | jq -r '.sha' )
ARGON_SHA=$( curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/webdollar/argon2/commits/master/status | jq -r '.sha' )
TAG=$(curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/webdollar/node-webdollar/releases/latest | jq -r '.tag_name' )

echo "$DOCKER_TOKEN" | docker login --username bwvolleyball --password-stdin

# shellcheck disable=SC2086
docker build -t bwvolleyball/webdollar-miner-container:latest -t bwvolleyball/webdollar-miner-container:$TAG --build-arg WEBDOLLAR=$WEBDOLLAR_SHA --build-arg ARGON=$ARGON_SHA .

docker push bwvolleyball/webdollar-miner-container:latest
# shellcheck disable=SC2086
docker push bwvolleyball/webdollar-miner-container:$TAG
