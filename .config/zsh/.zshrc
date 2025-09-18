[[ -f $HOME/.zshenv ]] && source $HOME/.zshenv
typeset -U PATH path

plugins=(fzf zshmarks zsh-autosuggestions)
source $ZDOTDIR/config.zsh

source $HOME/gizmos.git/.config/zsh/aliasrc

. "$HOME/.local/share/../bin/env"
