#!/bin/bash
VERBOSE=""
if [ "$1" = "-v" ] || [ "$1" = "--verbose" ]; then
  VERBOSE="--verbose"
fi

for f in $(ls $(brew --repo astikspandey/wutils)/Formula | sed 's/\.rb$//'); do
  [ "$f" = "wutils-uninstall" ] && continue
  if brew list --formula | grep -qx "$f"; then
    echo "Uninstalling $f..."
    brew uninstall $VERBOSE "$f"
  fi
done
echo "Removing wutils-uninstall..."
brew uninstall wutils-uninstall
