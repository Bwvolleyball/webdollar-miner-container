#!/usr/bin/env bash

if [ "$SOLO_MINING" = true ] ; then
  exec ./start_mining.sh
else
  exec ./start_pool_mining.sh
fi
