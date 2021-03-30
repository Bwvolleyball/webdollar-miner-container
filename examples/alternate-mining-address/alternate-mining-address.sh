#!/usr/bin/env bash

###
### Picks an address based on the day of the year.  Will alternate between all addresses configured.
###
### Required tools `bash`, `date`, `sleep`
###
### Setup:
###    Copy this script to your computer, ensure it is executable -> chmod +x alternate-mining-address.sh
###    Update WALLET_FILES with the paths to your WEBD wallets (json files) - space separated
###    IF your wallets are locked, set IS_LOCKED to true and update PASSWORD_FILES with the paths to your password.txt files.
###        Index should match WALLET_FILES, so the first password should unlock the first wallet, etc.
###    In start_miner function, set the MINING_POOL_URL to the pool you want to mine in
###

IS_LOCKED=false

# Space separated list of wallet.json paths
WALLET_FILES=( "/absolute/path/to/first/wallet.json" "/absolute/path/to/second/wallet.json" )
PASSWORD_FILES=( "/absolute/path/to/first/password.txt" "/absolute/path/to/second/password.txt" )

# Pick a 0 indexed wallet at random, based on the current date.
ADDRESS="$(($(date +%-j)%${#WALLET_FILES[@]}))"

stop_miner() {
	docker stop webdollar-miner
	docker rm webdollar-miner
}

start_miner() {
	# if the wallet is locked, capture the password value, otherwise, ignore.
	[[ $IS_LOCKED = true ]] && PASSWORD_VAL=$(cat "${PASSWORD_FILES[$ADDRESS]}") || PASSWORD_VAL=

	docker run \
	-e ENABLE_TIPS=true \
	-e MINING_POOL_URL='https://webdollar.mining.pool/pool/1/POOL_NAME/version/sha/https:$$domain.com:443' \
	-e WALLET=$(cat "${WALLET_FILES[$ADDRESS]}") \
	-e PASSWORD_PHRASE="$PASSWORD_VAL" \
	--name webdollar-miner --restart unless-stopped \
	-d bwvolleyball/webdollar-miner-container:1.3.02
}

echo "Stopping Miner"
stop_miner
echo "Miner stopped."
sleep 2s
echo "Starting miner with address $ADDRESS"
start_miner
echo "Miner started."
