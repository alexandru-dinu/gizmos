FZF_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"/fzf
FZF_ZSH="$FZF_DIR"/fzf.zsh

if [[ ! -d $FZF_DIR ]]; then
    echo "fzf is not installed in $FZF_DIR. Installing..."
    git clone --depth=1 https://github.com/junegunn/fzf.git $FZF_DIR
    $FZF_DIR/install --xdg --key-bindings --completion --no-update-rc --no-bash --no-fish
fi

[ -f $FZF_ZSH ] && source $FZF_ZSH
