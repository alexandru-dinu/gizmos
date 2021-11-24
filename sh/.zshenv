export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export npm_config_prefix="$HOME/.node_modules"

# PATH
export PATH=$HOME/miniconda3/bin:$PATH
export PATH=$HOME/.node_modules/bin:$PATH

# doom emacs
if [[ -d "$XDG_CONFIG_HOME"/emacs/bin ]]; then
    export PATH="$XDG_CONFIG_HOME"/emacs/bin:$PATH
fi

# ~/.config
export CONDARC="$XDG_CONFIG_HOME"/conda/condarc
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export R_ENVIRON_USER="$XDG_CONFIG_HOME"/R/Renviron
export R_PROFILE_USER="$XDG_CONFIG_HOME"/R/Rprofile
export IRBRC="$XDG_CONFIG_HOME"/irb/irbrc

# ~/.cache
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export OCTAVE_HISTFILE="$XDG_CACHE_HOME"/octave_hist

# misc
export LESSHISTFILE="-"
