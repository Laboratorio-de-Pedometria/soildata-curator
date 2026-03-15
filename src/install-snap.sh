#!/bin/bash
# install-snap.sh
# Installs the silicon-optimized inference snap (ollama) and pulls the
# DeepSeek model for use in the soildata-curator pipeline.
#
# Requirements:
#   - Ubuntu (latest LTS recommended)
#   - snapd installed and running (https://snapcraft.io/docs/installing-snapd)
#
# Usage:
#   bash src/install-snap.sh

set -euo pipefail

SNAP_NAME="ollama"
MODEL_NAME="deepseek-r1"

# Verify that snapd is available
if ! command -v snap &>/dev/null; then
  echo "Error: snapd is not installed or not in PATH." >&2
  echo "Please install snapd first: https://snapcraft.io/docs/installing-snapd" >&2
  exit 1
fi

# Install the silicon-optimized inference snap
echo "Installing the ${SNAP_NAME} inference snap..."
sudo snap install "${SNAP_NAME}"

# Pull the DeepSeek model
echo "Pulling the ${MODEL_NAME} model (this may take a while)..."
ollama pull "${MODEL_NAME}"

echo ""
echo "Setup complete."
echo "  Snap installed : ${SNAP_NAME}"
echo "  Model ready    : ${MODEL_NAME}"
echo ""
echo "To verify the installation, run:"
echo "  ollama list"
echo ""
echo "To start an interactive session with the model, run:"
echo "  ollama run ${MODEL_NAME}"
