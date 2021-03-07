npm run build_terminal_menu
npm run build_terminal_worker

echo "Mining in a pool initiated!"

COMMAND="node --max_old_space_size=10240 dist_bundle/terminal-menu-bundle.js"

TIP_URL=

if [ -z "$WALLET" ] || [ -z "$MINING_POOL_URL" ]
then
  echo "Interactive mode is not supported in this container."
  echo "You must specify a WALLET and MINING_POOL_URL!"
  exit 7
else
	if [ ! -z "$ENABLE_TIPS" ]
	then
		echo
		echo "Tipping is Enabled!"
		echo "I am truly grateful for your support!"
		echo
		TIP_URL='/r/WEBD\$gB75To6qnTLVkKsFgrM1RA85Vr1QQNPgof\$'
	fi
  echo $WALLET > wallet.json
  eval "$COMMAND -- --import-address wallet.json --list-addresses --mining-address 0 --mine-in-pool $MINING_POOL_URL$TIP_URL"
fi
