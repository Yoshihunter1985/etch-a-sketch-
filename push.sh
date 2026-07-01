#!/bin/bash
# push.sh — commit and push the etch-a-sketch project
#
# Usage:
#   ./push.sh "your commit message"
#
# Works whether you're online or offline:
#   - Always stages and commits locally first (so nothing is ever lost)
#   - Then checks for a connection to GitHub
#   - If online: pushes straight away
#   - If offline: leaves the commit sitting locally; just run
#     ./push.sh again once you're back online and it will push
#     everything that's queued up

set -e

MSG="$1"
if [ -z "$MSG" ]; then
  MSG="Update $(date '+%Y-%m-%d %H:%M')"
fi

cd "$(dirname "$0")"

echo "Staging files..."
git add -A

if git diff --cached --quiet; then
  echo "No changes to commit."
else
  git commit -m "$MSG"
  echo "Committed: $MSG"
fi

echo "Checking connection to GitHub..."
if git ls-remote origin &>/dev/null; then
  echo "Online — pushing..."
  git push origin main
  echo "Done. Pushed to GitHub."
else
  echo "No connection to GitHub right now."
  echo "Your work is safely committed locally."
  echo "Run ./push.sh again once you're back online to push it up."
fi
