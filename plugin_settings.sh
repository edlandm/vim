#! /bin/bash

SOURCE_DIR="$(pwd)/plugin_settings/"
DEST_DIR="$HOME/.vim/plugin_settings/"
if [ ! -d $DEST_DIR ]; then
    mkdir $DEST_DIR
fi

cd $DEST_DIR

for f in `ls -1 $SOURCE_DIR`; do
    if [ ! -e "$DEST_DIR$f" ]; then
        echo "$DEST_DIR$f"
        ln -s $SOURCE_DIR$f .
    fi
done

# return from DEST_DIR
cd -
