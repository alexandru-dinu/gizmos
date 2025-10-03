[[ -f $HOME/.zshenv ]] && source $HOME/.zshenv
typeset -U PATH path

# add plugin-dirs to fpath
plugins=(fzf zshmarks zsh-autosuggestions)
for p in $plugins; do
    fpath=($ZDOTDIR/plugins/$p $fpath)
done

zmodload zsh/complist
zmodload zsh/zle
autoload -Uz add-zsh-hook
autoload -Uz colors && colors
autoload -Uz compinit && compinit -u -C -d "$XDG_DATA_HOME/zsh/zcompdump"
autoload -U +X bashcompinit && bashcompinit

# use the default ls color theme
if [[ -z "$LS_COLORS" ]]; then
    (( $+commands[dircolors] )) && eval "$(dircolors -b)"
fi

unsetopt menu_complete      # do not autoselect the first completion entry
unsetopt flowcontrol        # disable start/stop flow control (^S/^Q)
setopt auto_menu            # show completion menu on successive tab press
setopt complete_in_word     # allow completion from within a word
setopt always_to_end        # move cursor to the end of the word on completion
setopt interactive_comments # allow comments
setopt auto_pushd           # make cd push the old dir onto the stack
setopt pushd_ignore_dups    # don't push multiple copies of the same dir
setopt pushdminus           # exchange the meaning of +/- when used with a number to specify a dir in the stack
setopt prompt_subst         # enable parameter expansion

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "$XDG_DATA_HOME/zsh/zcompcache"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

_comp_options+=(globdots)

# enable correction
setopt correct_all
alias cp='nocorrect cp'
alias man='nocorrect man'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias sudo='nocorrect sudo'

## history
HISTFILE="$XDG_DATA_HOME/zsh/history"
HISTSIZE=1000000
SAVEHIST=1000000

setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # append new entries incrementally as soon as they are entered

# keybindings
bindkey -M menuselect '^[[Z' reverse-menu-complete

# vi-mode
bindkey -v
export KEYTIMEOUT=1

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward
bindkey '^?' backward-delete-char

# use <C-g> to edit current command in $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^g' edit-command-line
bindkey -M vicmd '^g' edit-command-line

function zle-line-init zle-keymap-select {
    ZSH_PROMPT_ARROW="${${KEYMAP/vicmd/❮}/(main|viins)/❯}"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# copy selection to clipboard
function vi-yank-xclip {
    zle vi-yank
    echo "$CUTBUFFER" | pbcopy
}
zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip

# source plugins
for p in $plugins; do
    source $ZDOTDIR/plugins/$p/$p.plugin.zsh
done

# source starship
eval "$(starship init zsh)"

# aliases
alias ls='ls --color=auto -F'
alias la="ls -a"
alias ll='ls -lah'
alias diff='diff --color'
alias grep='grep --color=auto --exclude-dir=.git'
alias :e="${EDITOR}"
alias :q="exit"

cm() {
    mkdir -p "$1" && cd "$1"
}
sp() {
    local scratchpad="$HOME/.local/share/scratchpad"
    local sep=$(perl -E 'say "=" x 32')
    local startup_text="${sep} $(date +'%Y-%m-%d %H:%M:%S') ${sep}"
    local startup_cmd="execute \"normal Go${startup_text}\<esc>o\""

    ${EDITOR:-vim} -c ${startup_cmd} ${scratchpad}
}
# git diff vs current branch
gdc() {
    local branch=$(git branch --show-current)
    git diff origin/$branch "$1"
}
# conda
conda-activate() {
    source activate $(conda env list | awk '$1 !~ /^#/ {print $1}' | fzf)
}
conda-deactivate() {
    source deactivate
}
