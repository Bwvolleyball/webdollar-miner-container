#!/usr/bin/env bash
echo "Mining in a pool initiated!"

TIP_URL=
DECRYPT_WALLET_CMD=

if [ -z "$WALLET" ] || [ -z "$MINING_POOL_URL" ]
then
  echo "Interactive mode is not supported in this container."
  echo "You must specify a WALLET and MINING_POOL_URL!"
  exit 7
else
	if [ -n "$ENABLE_TIPS" ]
	then
		echo
		echo "Tipping is Enabled!"
		echo "I am truly grateful for your support!"
		echo
		# shellcheck disable=SC2016
		TIP_URL='/r/WEBD$gB75To6qnTLVkKsFgrM1RA85Vr1QQNPgof$'
	fi
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
    DECRYPT_WALLET_CMD="--set-password-file password.txt"
  fi

   ./webd --mine-in-pool "$MINING_POOL_URL$TIP_URL" "$DECRYPT_WALLET_CMD"
fi
