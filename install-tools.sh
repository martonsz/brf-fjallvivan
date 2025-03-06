#!/bin/bash
set -e
set -o pipefail

mkdir -p bin
curl -sfL https://raw.githubusercontent.com/martonsz/download-scripts/main/download-sops.sh | sh -s -- -b ./bin
curl -sfL https://raw.githubusercontent.com/martonsz/download-scripts/main/download-age.sh | sh -s -- -b ./bin

echo "-------------------------------------------------------------------"
echo "Installed tools into ./bin folder"
echo "Make sure you have the ./bin folder in your path to use these tools"
echo "This is configured automatically if you have direnv installed"
echo "-------------------------------------------------------------------"

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-"$HOME/.config"}
if [[ -z $SOPS_AGE_KEY_FILE ]] \
  && [[ -z $SOPS_AGE_KEY ]] \
  && [[ ! -r $XDG_CONFIG_HOME/sops/age/keys.txt ]]; then
  echo "WARNING age keys is not configured"
  echo "You will not be able to decrypt any secrets in this repository"
  echo "Place your private key in $XDG_CONFIG_HOME/sops/age/keys.txt"
fi
