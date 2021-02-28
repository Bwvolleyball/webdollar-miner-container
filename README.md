# WebDollar Node / Miner
> This is a fork of the morion4000 webdollar-node miner. Original version is [here](https://github.com/morion4000/webdollar-node).

## Build

`docker build -t bwvolleyball/webdollar-node:1.212.0 -f Dockerfile --no-cache .`

## Deploy

`docker push bwvolleyball/webdollar-node:1.212.0`

# Mining
> There are 2 ways to mine.  In both, you should provide your wallet.

environment variables:
`WALLET` - your WebDollar wallet (raw JSON)

When mining with a pool (recommended, default)
`MINING_POOL_URL` - the url of the mining pool you wish to join.
