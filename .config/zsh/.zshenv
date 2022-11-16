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

# PATH
export PATH=$HOME/miniconda3/bin:$PATH
export PATH=$HOME/.node_modules/bin:$PATH
# rust
source "$XDG_DATA_HOME/cargo/env"
# emacs
if [[ -d "$XDG_CONFIG_HOME"/emacs/bin ]]; then
    export PATH="$XDG_CONFIG_HOME"/emacs/bin:$PATH
fi

export npm_config_prefix="$HOME/.node_modules"

# ~/.config
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
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
