# WebDollar Node / Miner
> This is a fork of the morion4000 webdollar-node miner. Original version is [here](https://github.com/morion4000/webdollar-node).
>
> This project is in full on test mode. Use at your own risk. It relies on a forked variant of the WebDollar project.
> This project is not ready for real usage until changes to WebDollar are merged back into the main-stream project.

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

## Running the Container

#### Tips

The `MINING_POOL_URL` should be single-quoted (`'`).
`$` in `MINING_POOL_URL` must be escaped. `$` => `\$`.

The easist way to provide your `WALLET` is by catting out the file from your hard-drive.

You can find mining pool urls [from this awesome website](http://webdpools.com/pool/).

```bash
docker run \
-e MINING_POOL_URL='https://webdollar.mining.pool/pool/1/POOL_NAME/version/sha/https:\$\$domain.com:443' \
-e WALLET=$(cat ~/path/to/wallet.webd) \
bwvolleyball/webdollar-node:1.212.0
```
