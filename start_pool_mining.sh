npm run build_terminal_menu
npm run build_terminal_worker

COMMAND="node --max_old_space_size=10240 dist_bundle/terminal-menu-bundle.js"

if [ "$WALLET" = "" ]
then
  echo "Interactive mode is not supported in this container."
  echo "You must specify a WALLET and MINING_POOL_URL!"
  exit 7
else
  echo $WALLET > wallet.json
  eval "$COMMAND -- --import-address wallet.json --list-addresses --mining-address 0 --mine-in-pool $MINING_POOL_URL"
fi
