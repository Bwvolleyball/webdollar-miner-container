# WebDollar Miner Container
> This is a fork of the morion4000 webdollar-node miner. Original version is [here](https://github.com/morion4000/webdollar-node).

This project is updated weekly, based on changes in the upstream project.

![Build Badge](https://github.com/bwvolleyball/webdollar-miner-container/actions/workflows/build-container.yaml/badge.svg) ![Docker Image Version (latest by date)](https://img.shields.io/docker/v/bwvolleyball/webdollar-miner-container)

If you want, you can support me in WEBD for this project! My wallet address is `WEBD$gB75To6qnTLVkKsFgrM1RA85Vr1QQNPgof$` 

Thank you for your support!

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

Available environment variables - anything with a default of `<empty>` is unset by default in the container.
You must set it.

| ENV variable | Default | Purpose | Used For? (`solo`, `pool`, `both`) |
| ------------ | ------- | ------- | ---------------------------------- |
| `WALLET`     | `<empty>` | Your WEBD wallet - encrypted or unencrypted | `both` |
| `PASSWORD_PHRASE` | `<empty>` | Your WEBD wallet password phrase. Required to PoS mine if your wallet is encrypted | `both` |
| `SOLO_MINING` | `false` | If true, mine solo. If false, mine in a pool. If you're just starting out it is recommended to min in a pool. | `N/A` - decides which process |
| `MINING_POOL_URL` | `<empty>` | If you are mining in a pool, the pool URL you wish to join | `pool` |

```bash
docker run \
-e MINING_POOL_URL='https://webdollar.mining.pool/pool/1/POOL_NAME/version/sha/https:$$domain.com:443' \
-e WALLET=$(cat ~/path/to/wallet.webd) \
-e PASSWORD_PHRASE=$(cat ~/path/to/password.txt) \
bwvolleyball/webdollar-miner-container:1.3.02
```

## Proof of Stake 100%
> This branch has been re-worked to support the proof-of-stake 100% migration. Consider anything in this branch experimental.

There is an automated mechanism to maintain the WebDollar version for this container, therefore, while it is not in the mainnet
all proof of stake containers will be suffixed with `-pos100`.  You can find a complete list of tags here: [bwvolleyball/webdollar-miner-container](https://hub.docker.com/r/bwvolleyball/webdollar-miner-container/tags?page=1&ordering=last_updated)
