export npm_config_prefix=$HOME/.node_modules

export PATH=$HOME/miniconda3/bin:$PATH
export PATH=$HOME/.node_modules/bin:$PATH
if [[ -d $HOME/.emacs.d/bin ]]; then
    export PATH=$HOME/.emacs.d/bin:$PATH
fi

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
