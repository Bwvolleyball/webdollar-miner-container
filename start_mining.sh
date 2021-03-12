#!/usr/bin/env bash

echo "Solo mining initiated. Good Luck!"

wget http://webd-blockchain.ddns.net:9001/blockchainDB3.tar.gz
mkdir blockchainDB3
tar -C blockchainDB3 -zxvf blockchainDB3.tar.gz
unlink blockchainDB3.tar.gz

echo "Done downloading the blockchain. Now the fun begins!"

DECRYPT_WALLET_CMD=

if [ -z "$WALLET" ]
then
  echo "Interactive mode is not supported in this container."
  echo "You must specify a WALLET!"
  exit 7
else
  echo "$WALLET" > wallet.json
  # Import the wallet
  ./webd --import-address wallet.json --list-addresses --mining-address 0

  if [ -n "$PASSWORD_PHRASE" ]
  then
    echo
    echo "Password provided, unlocking wallet for PoS mining!"
    echo

    echo "$PASSWORD_PHRASE" > password.txt
    DECRYPT_WALLET_CMD="--set-password-file password.txt"
  fi

  # solo mining.
  ./webd --mine "$DECRYPT_WALLET_CMD"
fi
