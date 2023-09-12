!#/bin/bash
DEST_DIR="/homa/sasha"
cp ./.bashrc $DEST_DIR/.bashrc
cp ./.xinitrc $DEST_DIR/.xinitrc
cp ./.vimrc $DEST_DIR/.vimrc
killall dwm