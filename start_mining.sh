#!/usr/bin/env bash

echo "Solo mining initiated. Good Luck!"

#wget http://webd-blockchain.ddns.net:9001/blockchainDB3.tar.gz
fileid="1l7Uj-aqQYZuZ-pymkAuK93sUxcpZCIu2"
filename="blockchainDB3.tar.gz"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o "${filename}"

#wget -O blockchainDB3.tar.gz https://mega.nz/file/awMknD5Y#yr_XdfiNTU2vQTpOD-znihyZzNiSQDmtcaDeOvQ60AA
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
  ./webd --import-address wallet.json
  # Allow initial WEBD project to settle.
  sleep 2
  WALLET_ADDRESS=$(cat ./wallet.json | jq -r '.address')
  POS=$(./webd --list-addresses | grep -F -- "$WALLET_ADDRESS" | awk '{print $2}')
  echo "Found POS for address"
  echo
  echo "$POS <-> $WALLET_ADDRESS"
  echo
  # Print initial addresses
  ./webd --mining-address "$POS" --list-addresses


  if [ -n "$PASSWORD_PHRASE" ]
  then
    echo
    echo "Password provided, unlocking wallet for PoS mining!"
    echo

    echo "$PASSWORD_PHRASE" > password.txt
    ./webd --mining-address "$POS" --mine --set-password-file password.txt
  else
    ./webd --mining-address "$POS" --mine
  fi
fi
