export LANG=en_US.UTF-8
export LC_ALL=$LANG
export EDITOR=vim

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export VIRTUAL_ENV_DISABLE_PROMPT=1

# miniconda3
export PATH="$HOME/miniconda3/bin:$PATH"

# node & npm
# main instalation
if [[ -d "$HOME/.local/opt/node/bin" ]]; then
    export PATH="$HOME/.local/opt/node/bin:$PATH"
fi
# this path can containe more recent npm / npx versions,
# so search here first
if [[ -d "$HOME/.node_modules/bin" ]]; then
    export PATH="$HOME/.node_modules/bin:$PATH"
    export npm_config_prefix="$HOME/.node_modules"
fi

# rust
if [[ -f "$XDG_DATA_HOME/cargo/env" ]]; then
    source "$XDG_DATA_HOME/cargo/env"
fi

# haskell
export GHCUP_USE_XDG_DIRS=true
if [[ -f "$XDG_DATA_HOME/ghcup/env" ]]; then
    source "$XDG_DATA_HOME/ghcup/env"
fi

# emacs
if [[ -d "$XDG_CONFIG_HOME"/emacs/bin ]]; then
    export PATH="$XDG_CONFIG_HOME/emacs/bin:$PATH"
fi

# ~/.config
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export IPYTHONDIR="$XDG_CONFIG_HOME"/ipython
export CONDARC="$XDG_CONFIG_HOME"/conda/condarc
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export R_ENVIRON_USER="$XDG_CONFIG_HOME"/R/Renviron
export R_PROFILE_USER="$XDG_CONFIG_HOME"/R/Rprofile
export IRBRC="$XDG_CONFIG_HOME"/irb/irbrc
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export WGETRC="$XDG_CONFIG_HOME"/wget/wgetrc

# ~/.cache
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export OCTAVE_HISTFILE="$XDG_CACHE_HOME"/octave_hist

# ~/.local/share
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# misc
export LESSHISTFILE=-
