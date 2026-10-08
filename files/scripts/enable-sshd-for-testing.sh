#!/usr/bin/env bash
set -oue pipefail

# Enable sshd for bcvk ephemeral testing.
# secureblue disables sshd by default. This script re-enables it
# at image build time so the symlinks exist in the built image.

echo "DorOS: Enabling sshd for bcvk testing..."
systemctl enable sshd.service
systemctl enable sshd.socket 2>/dev/null || true
echo "DorOS: sshd enabled."
