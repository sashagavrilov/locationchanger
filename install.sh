#!/bin/bash

INSTALL_DIR=/usr/local/bin
SCRIPT_NAME=locationchanger
LAUNCH_AGENTS_DIR=$HOME/Library/LaunchAgents
PLIST_NAME=$LAUNCH_AGENTS_DIR/LocationChanger.plist
APP_SUPPORT_DIR="$HOME/.locations" #/Library/Application Support/LocationChanger"

sudo -v

sudo cp "$SCRIPT_NAME" "$INSTALL_DIR"

sudo chmod +x ${SCRIPT_NAME}

# generate a default config file if it doesn't exists
if [ ! -e "${APP_SUPPORT_DIR}/LocationChanger.conf" ]; then
  mkdir -p "${APP_SUPPORT_DIR}"
  cp LocationChanger.conf "$APP_SUPPORT_DIR"
fi

if [ ! -e "${LAUNCH_AGENTS_DIR}/LocationChanger.plist" ]; then
  mkdir -p "${LAUNCH_AGENTS_DIR}"
  cp LocationChanger.plist "$LAUNCH_AGENTS_DIR"
fi
mkdir -p ${LAUNCH_AGENTS_DIR}

launchctl load ${PLIST_NAME}

echo "Install complete."
