#!/bin/bash
set -e

echo "=== Setting up Homebrew tap ==="

# Add and commit all files
git add .
git commit -m "Initial homebrew tap setup"

# Add remote origin
git remote add origin https://github.com/astikspandey/homebrew-wutils.git

# Push to GitHub
git push -u origin master

# Create and push tag
git tag v1.0.0
git push origin v1.0.0

echo ""
echo "=== Getting SHA256 ==="
SHA=$(curl -sL https://github.com/astikspandey/homebrew-wutils/archive/refs/tags/v1.0.0.tar.gz | shasum -a 256 | cut -d' ' -f1)
echo "SHA256: $SHA"

# Update all formulas with the SHA256
sed -i '' "s/PLACEHOLDER_SHA256/$SHA/g" Formula/*.rb

# Commit and push the SHA update
git add Formula/*.rb
git commit -m "Add SHA256 to formulas"
git push

echo ""
echo "=== Done! ==="
echo "To install your tools:"
echo "  brew tap astikspandey/wutils"
echo "  brew install wutils-ascii"
echo "  brew install wutils-date"
echo "  brew install wutils-endecode"
echo "  brew install wutils-filegen"
echo "  brew install wutils-loop"
