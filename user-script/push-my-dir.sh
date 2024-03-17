#!/bin/bash

BASE_DIR="/home/sasha/Code"

TARGET_DIRS=(
    $BASE_DIR/arch-linux-i3wm
    $BASE_DIR/ping-me-up
    $BASE_DIR/studies
    $BASE_DIR/sasha-sup.github.io
)

for TARGET_DIR in "${TARGET_DIRS[@]}"; do
  cd "$TARGET_DIR" || continue
  if git status | grep -q "nothing to commit, working tree clean"; then
    echo "No changes in $TARGET_DIR."
  else
    git add .
    git commit -m "Auto commit"
    git push
    echo "Changes in $TARGET_DIR committed and pushed."
  fi
done
