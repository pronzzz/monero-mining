#!/bin/bash
# Script to start the Monero miner using the configuration file.

# Ensure we are in the directory of the script
cd "$(dirname "$0")"

# Check if xmrig exists in the current folder or explicitly point to it.
# Assuming you build it in ./xmrig/build/ as per logs.
XMRIG_PATH="./xmrig/build/xmrig"

if [ ! -f "$XMRIG_PATH" ]; then
    echo "Error: xmrig executable not found at $XMRIG_PATH"
    echo "Please update the XMRIG_PATH variable in this script."
    # Fallback to checking if it's in the current path
    if [ -f "./xmrig" ]; then
        XMRIG_PATH="./xmrig"
    else
        exit 1
    fi
fi

# Run xmrig with the config file
echo "Starting Monero Miner..."
$XMRIG_PATH --config=config.json
