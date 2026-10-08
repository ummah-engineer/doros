#!/usr/bin/env bash
set -oue pipefail

# ─────────────────────────────────────────────────────────────
# Enable sshd for bcvk testing.
#
# secureblue disables sshd.service by default. bcvk ephemeral
# run-ssh requires SSH to be available in the VM. This script
# enables sshd only for testing purposes.
#
# In production, this script should be removed from the recipe,
# or sshd should be firewalled off so it is not reachable from
# the network.
# ─────────────────────────────────────────────────────────────

echo "DorOS: Enabling sshd for bcvk testing..."
systemctl enable sshd.service

# Ensure the sshd socket is also enabled if it exists
systemctl enable sshd.socket 2>/dev/null || true

echo "DorOS: sshd enabled for testing."
