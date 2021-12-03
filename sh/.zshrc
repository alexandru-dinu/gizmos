export LANG=en_US.UTF-8
export LC_ALL=$LANG
export EDITOR=nvim

export ZSH=$HOME/.zsh
export ZSH_FRAMEWORK=$ZSH/simple-zsh

plugins=(fzf zshmarks zsh-autosuggestions)

source $ZSH_FRAMEWORK/simple-zsh.zsh
source $HOME/gizmos.git/sh/aliasrc
