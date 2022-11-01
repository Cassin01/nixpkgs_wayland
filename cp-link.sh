#!/bin/bash

# -e: Abort script when error is occurred.
# -o: Abort script when error is occurred in pipeline
set -e -o pipefail


cp /etc/nixos/configuration.nix ~/.config/nixpkgs/
cp -r ~/.config/sway ~/.config/nixpkgs/cnf/
