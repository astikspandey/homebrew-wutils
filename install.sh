#!/bin/bash
brew tap astikspandey/wutils
for f in $(ls $(brew --repo astikspandey/wutils)/Formula | sed 's/\.rb$//'); do
  [ "$f" = "wutils-install" ] && continue
  brew list --formula | grep -qx "$f" || { echo "Installing $f..."; brew install astikspandey/wutils/$f; }
done
echo "Removing wutils-install..."
brew uninstall wutils-install
