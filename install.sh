#!/bin/bash
brew tap astikspandey/wutils
for f in $(ls $(brew --repo astikspandey/wutils)/Formula | sed 's/\.rb$//'); do
  brew list --formula | grep -qx "$f" || { echo "Installing $f..."; brew install astikspandey/wutils/$f; }
done
