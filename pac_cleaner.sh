#!/bin/bash

# Fetch the mirrorlist using reflector for Canada and the USA and select the best mirrors
echo "Fetching mirror list for Canada and the USA..."
MIRROR_LIST=$(reflector --country CA,US --latest 20 --sort rate --save /etc/pacman.d/mirrorlist)

# Synchronize package databases and update packages
echo "Synchronizing package databases and updating packages..."
yay -Syyu

# Clean the package cache
echo "Cleaning package cache..."
sudo pacman -Sc

# Vacuum the journal logs to keep only 4 weeks of logs
echo "Vacuuming journal logs..."
journalctl --vacuum-time=4weeks

# Remove all cached versions of uninstalled packages
echo "Removing cached versions of uninstalled packages..."
paccache -ruk0

# Remove unused packages (orphans)
echo "Removing orphaned packages..."
ORPHANS=$(pacman -Qdtq)
if [ -n "$ORPHANS" ]; then
  sudo pacman -Rns $ORPHANS
else
  echo "No orphaned packages to remove."
fi
