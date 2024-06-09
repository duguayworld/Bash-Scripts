#!/bin/bash

# Fetch the mirrorlist 
echo "Fetching mirror list..."
echo "$1" | eos-rankmirrors

read -p "Press Y to continue, or N to exit: " input
if [[ ! $input =~ ^[Yy]$ ]]; then
    echo "Exiting..."
    exit 0
fi

# Synchronize package databases and update packages
echo "Synchronizing package databases and updating packages..."
echo "$1" | yay -Syyu

read -p "Press Y to continue, or N to exit: " input
if [[ ! $input =~ ^[Yy]$ ]]; then
    echo "Exiting..."
    exit 0
fi

# Clean the package cache
echo "Cleaning package cache..."
echo "$1" | sudo pacman -Sc

read -p "Press Y to continue, or N to exit: " input
if [[ ! $input =~ ^[Yy]$ ]]; then
    echo "Exiting..."
    exit 0
fi

# Vacuum the journal logs to keep only 1 week of logs
echo "Vacuuming journal logs..."
journalctl --vacuum-time=1week

read -p "Press Y to continue, or N to exit: " input
if [[ ! $input =~ ^[Yy]$ ]]; then
    echo "Exiting..."
    exit 0
fi

# Remove all cached versions of uninstalled packages
echo "Removing cached versions of uninstalled packages..."
echo "$1" | paccache -ruk0

read -p "Press Y to continue, or N to exit: " input
if [[ ! $input =~ ^[Yy]$ ]]; then
    echo "Exiting..."
    exit 0
fi

# Remove Orphans
echo "Removing orphaned packages..."
ORPHANS=$(pacman -Qdtq)
if [ -n "$ORPHANS" ]; then
  echo "$1" | sudo pacman -Rns $ORPHANS
else
  echo "No orphaned packages to remove."
fi
