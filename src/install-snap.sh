#!/bin/bash
# install-snap.sh
# Installs the deepseek-r1 silicon-optimized inference snap from Canonical.
# The snap bundles the DeepSeek R1 reasoning model together with a
# hardware-optimized runtime — no separate model download is required.
#
# Requirements:
#   - Ubuntu (latest LTS recommended)
#   - snapd installed and running (https://snapcraft.io/docs/installing-snapd)
#
# Documentation:
#   https://documentation.ubuntu.com/inference-snaps/
#
# Usage:
#   bash src/install-snap.sh

set -euo pipefail

SNAP_NAME="deepseek-r1"

# Verify that snapd is available; attempt to install it if missing
if ! command -v snap &>/dev/null; then
  echo "snapd is not installed or not in PATH. Attempting to install snapd..."
  if command -v apt-get &>/dev/null; then
    sudo apt-get update -y
    sudo apt-get install -y snapd
    # Add snap to PATH for the current session only; users may need to restart their
    # shell or add /snap/bin to their shell profile for this to persist across sessions.
    export PATH="${PATH}:/snap/bin"
    if ! command -v snap &>/dev/null; then
      echo "Error: snapd installation failed." >&2
      echo "Please install snapd manually: https://snapcraft.io/docs/installing-snapd" >&2
      exit 1
    fi
  else
    echo "Error: Cannot install snapd automatically on this system." >&2
    echo "Please install snapd first: https://snapcraft.io/docs/installing-snapd" >&2
    exit 1
  fi
fi

# Install curl and jq — used to interact with the inference snap's REST API
echo "Installing curl and jq..."
sudo apt-get update -y -qq
sudo apt-get install -y curl jq

# Install the silicon-optimized inference snap (currently in the beta channel)
echo "Installing the ${SNAP_NAME} inference snap..."
sudo snap install "${SNAP_NAME}" --beta

echo ""
echo "Setup complete."
echo "  Snap installed : ${SNAP_NAME}"
echo ""
echo "To verify the installation, run:"
echo "  ${SNAP_NAME} --help"
echo ""
echo "To check the status of the model, run:"
echo "  ${SNAP_NAME} status"
echo ""
echo "To start an interactive chat session, run:"
echo "  ${SNAP_NAME} chat"
