#!/bin/bash
VERBOSE=""
if [ "$1" = "-v" ] || [ "$1" = "--verbose" ]; then
  VERBOSE="--verbose"
fi

brew tap astikspandey/wutils
for f in $(ls $(brew --repo astikspandey/wutils)/Formula | sed 's/\.rb$//'); do
  [ "$f" = "wutils-install" ] && continue
  echo "Installing $f..."
  brew install $VERBOSE astikspandey/wutils/$f
done
echo "Removing wutils-install..."
brew uninstall wutils-install
