#!/usr/bin/env bash
set -oue pipefail

# Download the latest starship binary and install it to /usr/bin.
# Starship is a single static binary; no package manager needed.

echo "DorOS: Installing starship from upstream release..."

STARSHIP_VERSION="v1.22.1"
STARSHIP_URL="https://github.com/starship/starship/releases/download/${STARSHIP_VERSION}/starship-x86_64-unknown-linux-gnu.tar.gz"

curl -fsSL "${STARSHIP_URL}" -o /tmp/starship.tar.gz
tar -xzf /tmp/starship.tar.gz -C /tmp
install -m 0755 /tmp/starship /usr/bin/starship
rm -f /tmp/starship.tar.gz /tmp/starship

# Verify
/usr/bin/starship --version

echo "DorOS: starship installed."
