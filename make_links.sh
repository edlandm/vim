#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BIN_LOCAL=$HOME/bin
BIN_REMOTE=$DIR/bin
ZSH_LOCAL=$HOME/.zsh
ZSH_REMOTE=$DIR/zsh
VIM_REMOTE=#DIR/vim

if [ ! -e $HOME/.bash_profile ];then
    ln -s $DIR/.bash_profile $HOME/.bash_profile
fi

if [ ! -e $HOME/.vimrc ];then
    ln -s $VIM_REMOTE/.vimrc $HOME/.vimrc
fi

if [! -e $HOME/.tmux.conf ];then
    ln -s $DIR/.tmux.conf $HOME/.tmux.conf
fi

if [! -e $HOME/.tmux.reset.conf ];then
    ln -s $DIR/.tmux.reset.conf $HOME/.tmux.reset.conf
fi

if [! -e $HOME/.zshrc];then
    ln -s $ZSH_REMOTE/.zshrc
fi

if [! -d $ZSH_LOCAL ];then
    mkdir $ZSH_LOCAL
fi

if [! -e $ZSH_LOCAL/.alias* ];then
    ln -s $ZSH_REMOTE/.alias* $ZSH_LOCAL
fi
