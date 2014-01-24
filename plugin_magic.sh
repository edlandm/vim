#!/bin/bash

VIM_BUNDLE_DIR=$HOME/.vim/bundle
VIZARDRY_DIR=$VIM_BUNDLE_DIR/vizardry
MAGIC_DIR=$VIZARDRY_DIR/plugin/magic
VIM_SRC_DIR=$HOME/dotfiles/vim

if [ -d VIM_SRC_DIR ];then
    echo "Sorry, $VIM_SRC_DIR doesn't seem to exist so your files can't be found"
    kill -SIGINT $$
fi

if [ ! -d $VIZARDRY_DIR ];then
    cd $VIM_BUNDLE_DIR
    git clone https://github.com/ardagnir/vizardry
    cd - > /dev/null
fi

if [ ! -d $MAGIC_DIR ];then
    echo "Creating $MAGIC_DIR"
    mkdir $MAGIC_DIR
fi

for f in `ls -1 $VIM_SRC_DIR/plugin_magic`;do
    if [ ! -e $MAGIC_DIR/$f ];then
        echo "Linking: $f"
        ln -s $VIM_SRC_DIR/plugin_magic/$f $MAGIC_DIR
    fi
done

echo "Done linking magic files."
