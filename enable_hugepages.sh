#!/bin/bash
# Script to enable Huge Pages for Monero Mining optimization.
# Needs to run with sudo.

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (use sudo)"
  exit 1
fi

echo "Applying Huge Pages settings..."

# Try to set 1280 pages (approx 2.5GB, might be too much for Pi 3B, but OS will cap it)
# For Pi 3B (1GB RAM), we might only get ~400-500MB usable.
# But for randomX usually 1280 is the target for full datasets on larger RAM systems.
# We will try a safe value of 128 for Pi 3B to at least enable the feature for lighter algos,
# or 1280 if you are on a Pi 4 (4GB).

read -p "Are you on a Raspberry Pi 3 (1GB RAM) [y/n]? " is_pi3

if [[ "$is_pi3" =~ ^[Yy]$ ]]; then
    # restricted implementation for 1GB RAM
    PAGES=128
    echo "Setting hugepages to $PAGES for low-memory device..."
else
    # standard for Pi 4 4GB+
    PAGES=1280
    echo "Setting hugepages to $PAGES for high-memory device..."
fi

sysctl -w vm.nr_hugepages=$PAGES

echo ""
echo "Huge Pages set (Temporary). To make permanent:"
echo "1. Edit /boot/firmware/cmdline.txt (or /boot/cmdline.txt)"
echo "2. Add the following to the end of the line (do not add a new line):"
echo "   default_hugepagesz=2M hugepages=$PAGES"
echo ""
echo "Note: 1GB memory pages are generally not available on standard Pi kernels, using 2M default."
