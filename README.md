# WebDollar Node / Miner

## Build

`docker build -t morion4000/webdollar-node:1.211.5 -f Dockerfile --no-cache .`

## Deploy

`docker push morion4000/webdollar-node:1.211.5`

# Mining
> There are 2 ways to mine.  In both, you should provide your wallet.

environment variables:
`WALLET` - your WebDollar wallet (raw JSON)

When mining with a pool (recommended, default)
`MINING_POOL_URL` - the url of the mining pool you wish to join.
