# WebDollar Miner Container
> This is a fork of the morion4000 webdollar-node miner. Original version is [here](https://github.com/morion4000/webdollar-node).

This project is updated weekly, based on changes in the upstream project.

![Build Badge](https://github.com/bwvolleyball/webdollar-miner-container/actions/workflows/build-container.yaml/badge.svg) ![Docker Image Version (latest by date)](https://img.shields.io/docker/v/bwvolleyball/webdollar-miner-container)

## Build

Caching is per dependant repository.  You can disable caching for the critical parts of this build via `--build-arg WEBDOLLAR=$RANDOM`, or you can force all parts of the container to rebuild with `--no-cache`.

Look at the github actions & `docker-build.sh` for more details.

`docker build -t bwvolleyball/webdollar-miner-container:${TAG} .`

## Deploy

`docker push bwvolleyball/webdollar-miner-container:${TAG}`

# Mining
> There are 2 ways to mine.  In both, you should provide your wallet.

environment variables:
`WALLET` - your WebDollar wallet (raw JSON)

When mining with a pool (recommended, default)
`MINING_POOL_URL` - the url of the mining pool you wish to join.

## Running the Container

#### Tips

The `MINING_POOL_URL` should be single-quoted (`'`).
`$` in `MINING_POOL_URL` must be escaped. `$` => `\$`.

The easist way to provide your `WALLET` is by catting out the file from your hard-drive.

You can find mining pool urls [from this awesome website](http://webdpools.com/pool/).

To see the list of tags, [go here](https://hub.docker.com/repository/docker/bwvolleyball/webdollar-miner-container).
It is recommended to use the latest tag. The latest tag should also be displayed in this readme.

```bash
docker run \
-e MINING_POOL_URL='https://webdollar.mining.pool/pool/1/POOL_NAME/version/sha/https:\$\$domain.com:443' \
-e WALLET=$(cat ~/path/to/wallet.webd) \
bwvolleyball/webdollar-miner-container:1.3.02
```
