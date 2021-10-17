alias gdb="gdb -q"
alias i="ipython"
alias ta="tmux attach"
alias td="tmux detach"

alias :e="nvim"
alias :q="exit"

c()  {
    cd "$1" && ls
}
rs()  {
    (redshift -x && ([ "$1" = "x" ] && return || redshift -O "$1" -g 0.9)) &>/dev/null
}
bgopen()  {
    xdg-open "$1" &>/dev/null & disown
}

# scratchpad
sp()  {
    local scratchpad="${HOME}/.scratchpad"
    local sep=$(perl -E 'say "=" x 32')
    local startup_text="${sep} $(date +'%Y-%m-%d %H:%M:%S') ${sep}"
    local startup_cmd="execute \"normal Go${startup_text}\<esc>o\""

    ${EDITOR:-vim} -c ${startup_cmd} ${scratchpad}
}

# git diff vs current branch
gdc()  {
    local branch=$(git branch --show-current)
    git diff origin/$branch "$1"
}
