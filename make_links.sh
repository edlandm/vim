#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BIN_LOCAL=$HOME/bin
BIN_REMOTE=$DIR/bin
ZSH_LOCAL=$HOME/.zsh
ZSH_REMOTE=$DIR/zsh
VIM_REMOTE=#DIR/vim

if [ ! -e `readlink $HOME/.bash_profile` ];then
    ln -s $DIR/.bash_profile $HOME/.bash_profile
fi

if [ ! -e `readlink $HOME/.vimrc` ];then
    ln -s $VIM_REMOTE/.vimrc $HOME/.vimrc
fi

if [ ! -e `readlink $HOME/.tmux.conf` ];then
    ln -s $DIR/.tmux.conf $HOME/.tmux.conf
fi

if [ ! -e `readlink $HOME/.tmux.reset.conf` ];then
    ln -s $DIR/.tmux.reset.conf $HOME/.tmux.reset.conf
fi

if [ ! -e `readlink $HOME/.zshrc` ];then
    ln -s $ZSH_REMOTE/.zshrc
fi

if [ ! -d $ZSH_LOCAL ];then
    mkdir $ZSH_LOCAL
fi

if [ ! -e `readlink $ZSH_LOCAL/.alias.zsh` ];then
    ln -s $ZSH_REMOTE/.alias.zsh $ZSH_LOCAL
fi

if [ ! -e `readlink $ZSH_LOCAL/.alias.local.zsh` ];then
    ln -s $ZSH_REMOTE/.alias.local.zsh $ZSH_LOCAL
fi
