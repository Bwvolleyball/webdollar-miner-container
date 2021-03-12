# WebDollar Miner Container
> This is a fork of the morion4000 webdollar-node miner. Original version is [here](https://github.com/morion4000/webdollar-node).

This project is updated weekly, based on changes in the upstream project.

![Build Badge](https://github.com/bwvolleyball/webdollar-miner-container/actions/workflows/build-container.yaml/badge.svg) ![Docker Image Version (latest by date)](https://img.shields.io/docker/v/bwvolleyball/webdollar-miner-container)

If you want, you can support me in WEBD for this project!  Using the WEBD referal system, you can donate a small percentage of the WEBD you mine to me.  Your support means the world to me!  This feature is completely optional, and you can disable it at any time. 

Thank you for your support!

To tip, add this to your command:

```
-e ENABLE_TIPS=true
```

Alternatively, I'd also appreciate any tips sent directly to me: `WEBD$gB75To6qnTLVkKsFgrM1RA85Vr1QQNPgof$`.

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
| `ENABLE_TIPS` | `<empty>` | If this project is awesome for you, and you mine in a pool, set this variable to send some love my way! :heart: | `pool` |



#### Tips

The `MINING_POOL_URL` should be single-quoted (`'`).
Earlier versions of this container required the `$` in the `MINING_POOL_URL` to be escaped (`\$`),
however, these restrictions have been fixed! If you single tick the url, everything should work!

The easiest way to provide your `WALLET` and `PASSWORD_PHRASE is by catting out the files from your hard-drive.

You can find mining pool urls [from this awesome website](http://webdpools.com/pool/).

To see the list of tags, [go here](https://hub.docker.com/repository/docker/bwvolleyball/webdollar-miner-container).
It is recommended to use the latest tag. The latest tag should also be displayed in this readme.

```bash
docker run \
-e ENABLE_TIPS=true \
-e MINING_POOL_URL='https://webdollar.mining.pool/pool/1/POOL_NAME/version/sha/https:$$domain.com:443' \
-e WALLET=$(cat ~/path/to/wallet.webd) \
-e PASSWORD_PHRASE=$(cat ~/path/to/password.txt) \
bwvolleyball/webdollar-miner-container:1.3.02
```
