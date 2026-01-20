#!/bin/bash
if [ -z "$1" ]; then
  echo "Usage: filegen <file size in kb> <output file (optional)>"
elif [ -z $2 ]; then
  curl -s "https://file-gen.vercel.app?kb=$1"
else
  curl -s "https://file-gen.vercel.app?kb=$1" > $2
fi
