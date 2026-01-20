#!/bin/bash
set -e

REPO_URL="https://github.com/astikspandey/homebrew-wutils.git"

echo "=== Setting up Homebrew tap ==="

# Add and commit all files (skip if nothing to commit)
git add .
git commit -m "Initial homebrew tap setup" || echo "Nothing new to commit"

# Add or update remote origin
if git remote | grep -q "^origin$"; then
    git remote set-url origin "$REPO_URL"
    echo "Updated remote origin"
else
    git remote add origin "$REPO_URL"
    echo "Added remote origin"
fi

# Push to GitHub
git push -u origin master

# Create and push tag (skip if exists)
if git tag -l | grep -q "^v1.0.0$"; then
    echo "Tag v1.0.0 already exists"
else
    git tag v1.0.0
fi
git push origin v1.0.0 || echo "Tag already pushed"

echo ""
echo "=== Getting SHA256 ==="
SHA=$(curl -sL https://github.com/astikspandey/homebrew-wutils/archive/refs/tags/v1.0.0.tar.gz | shasum -a 256 | cut -d' ' -f1)
echo "SHA256: $SHA"

# Update all formulas with the SHA256
sed -i '' "s/PLACEHOLDER_SHA256/$SHA/g" Formula/*.rb

# Commit and push the SHA update
git add Formula/*.rb
git commit -m "Add SHA256 to formulas" || echo "SHA256 already up to date"
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
