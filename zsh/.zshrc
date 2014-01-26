# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# Path for zsh files (mostly ones that get sourced
ZHOME=$HOME/.zsh
if [ ! -d "$HOME/.zsh" ];then
    mkdir -p "$HOME/.zsh"
fi


#Put bin at the front of the Path
#set path for bin
PATH="/Users/miles/bin:/opt/local/bin:/opt/local/sbin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export PATH=$PATH

#Set terminal type
export TERM="xterm-256color"

#Virtualenv Completion (workon)
#. /etc/bash_completion.d/virtualenvwrapper

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# Themes I like:
#   af-magic #   arrow #   avit #   bira #   dpoggi
#   dstufft #   fletcherm #   fox #   gnzh #   intheloop
#   jonathan #   josh #   jtriley #   kardan #   kphoen
#   michelebologna #   pmcgee #   re5et #   ys
# af-magic -- Previous theme
#ZSH_THEME="jonathan"
ZSH_THEME="kphoen"

APPEND_HISTORY="true"
AUTO_MENU="true"
AUTO_REMOVE_SLASH="true"
DVORAK="false"
EXTENDED_GLOB="true"
GLOB_DOTS="true"
HISTORY_IGNORE_DUPS="true"
HISTORY_IGNORE_SPACE="true"
NULL_GLOBS="true"

setopt autocd
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git pip zsh-syntax-highlighting)

#Fuzzy matching of completions for when you mistype them:
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# History Expansion on <space>
bindkey " " magic-space

#Loads zmv (zmv is for some massive file moving magic)
autoload -U zmv

source $ZSH/oh-my-zsh.sh

# vi-mode
#bindkey -v
# The default delay between mode-switches is .4seconds. Let's change that to .1seconds
# export KEYTIMEOUT=1
# Insert-Mode Mappings (To make it behave more like a normal terminal)
# "^" = Ctrl
#bindkey '^a' beginning-of-line
#bindkey '^e' end-of-line
#bindkey '^l' clear-screen
#bindkey '^u' kill-whole-line
#bindkey 'jk' vi-cmd-mode
#bindkey 'kj' vi-cmd-mode

# Indicate in prompt which mode is active
#function zle-line-init zle-keymap-select {
    #VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
    #RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $ZSH_THEME $EPS1"
    #zle reset-prompt
#}
#zle -N zle-line-init
#zle -N zle-keymap-select

# opp.zsh enables text objects for zsh
#if [ ! -d "$HOME/.zsh/opp.zsh" ];then
    #cd "$HOME/.zsh"
    #git clone https://github.com/hchbaw/opp.zsh
    #cd -
#fi
#source "$HOME/.zsh/opp.zsh/opp.zsh"

# Source Aliases
if [ -L $ZHOME/.alias.zsh ];then
    source $HOME/`readlink $ZHOME/.alias.zsh`
fi
if [ -L $ZHOME/.alias.local.zsh ];then
    source $HOME/`readlink $ZHOME/.alias.local.zsh`
fi
