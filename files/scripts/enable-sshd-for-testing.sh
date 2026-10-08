#!/usr/bin/env bash
set -oue pipefail

# Enable sshd for bcvk ephemeral testing.
#
# secureblue MASKS sshd (symlinks it to /dev/null), not just
# disables it. systemctl enable alone fails on a masked unit.
# You must unmask first, then enable.

echo "DorOS: Unmasking sshd..."
systemctl unmask sshd.service
systemctl unmask sshd.socket 2>/dev/null || true

echo "DorOS: Enabling sshd..."
systemctl enable sshd.service
systemctl enable sshd.socket 2>/dev/null || true

echo "DorOS: sshd enabled for testing."
