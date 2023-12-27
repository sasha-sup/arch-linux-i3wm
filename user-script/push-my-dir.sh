#!/bin/bash

BASE_DIR="/home/sasha/Code"

TARGET_DIRS=(
    $BASE_DIR/arch-linux-i3wm
    $BASE_DIR/ping-me-up
    $BASE_DIR/studies
)

for TARGET_DIR in "${TARGET_DIRS[@]}"; do
  cd "$TARGET_DIR" || continue
  if git diff --quiet; then
    echo "No changes in $TARGET_DIR."
  else
    git add .
    git commit -m "Automatic commit"
    git push
    echo "Changes in $TARGET_DIR committed and pushed."
  fi
done
