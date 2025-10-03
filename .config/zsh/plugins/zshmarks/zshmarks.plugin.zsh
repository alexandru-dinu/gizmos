# ------------------------------------------------------------------------------
#          FILE:  zshmarks.plugin.zsh
#   DESCRIPTION:  zsh plugin file.
#        AUTHOR:  Jocelyn Mallon
#       VERSION:  1.7.1
# ------------------------------------------------------------------------------

export BOOKMARKS_FILE=${BOOKMARKS_FILE:-$HOME/.local/share/zsh/bookmarks}

if [[ -L $BOOKMARKS_FILE ]]; then
    BOOKMARKS_FILE=$(readlink $BOOKMARKS_FILE)
fi

if [[ ! -f $BOOKMARKS_FILE ]]; then
    mkdir -p $(dirname $BOOKMARKS_FILE) && touch $BOOKMARKS_FILE
fi

__zshmarks_zgrep() {
    local outvar="$1"; shift
    local pattern="$1"
    local filename="$2"
    local file_contents="$(<"$filename")"
    local file_lines; file_lines=(${(f)file_contents})

    for line in "${file_lines[@]}"; do
        if [[ "$line" =~ "$pattern" ]]; then
            eval "$outvar=\"$line\""
            return 0
        fi
    done

    return 1
}

bookmark() {
    local name=$1
    [ -z $name ] && name="${PWD##*/}"

    cur_dir="$(pwd)"

   # Replace /home/uname with $HOME
    if [[ "$cur_dir" =~ ^"$HOME"(/|$) ]]; then
        cur_dir="\$HOME${cur_dir#$HOME}"
    fi

    # Store the bookmark as folder|name
    bookmark="$cur_dir|$name"

    if [[ -z $(grep "$bookmark" $BOOKMARKS_FILE 2> /dev/null) ]]; then
        echo $bookmark >> $BOOKMARKS_FILE
        echo "Bookmark saved: $name -> $cur_dir"
    else
        echo "Bookmark already exists: $name -> $cur_dir"
        return 1
    fi
}

jump() {
    local name=$1
    local bookmark

    if ! __zshmarks_zgrep bookmark "\\|$name\$" "$BOOKMARKS_FILE"; then
        echo "Invalid bookmark name."
        return 1
    else
        eval "cd \"${bookmark%%|*}\""
    fi
}

showmarks() {
    local bookmark_file="$(<"$BOOKMARKS_FILE")"
    local bookmark_array; bookmark_array=(${(f)bookmark_file});
    local name bookmark_path bookmark_line
    local out=""

    for bookmark_line in $bookmark_array; do
        bookmark_path="${bookmark_line%%|*}"
        bookmark_path="${bookmark_path/\$HOME/~}"
        name="${bookmark_line#*|}"
        out+="$name: $bookmark_path\n"
    done

    echo "$out" | sort -k1 | column -t -s':'
}

deletemark()  {
    local name=$1

    if [[ -z $name ]]; then
        echo "Please provide a name for the bookmark to delete."
        return 1
    else
        local bookmark_line bookmark_search
        local bookmark_file="$(<"$BOOKMARKS_FILE")"
        local bookmark_array; bookmark_array=(${(f)bookmark_file});
        bookmark_search="*\|${name}"

        if [[ -z ${bookmark_array[(r)$bookmark_search]} ]]; then
            echo "Bookmark ${name} not found, skipping."
        else
            bookmark_line=${bookmark_array[(r)$bookmark_search]}
            bookmark_array=(${bookmark_array[@]/$bookmark_line})
            eval "printf '%s\n' \"\${bookmark_array[@]}\"" >! $BOOKMARKS_FILE
        fi
    fi
}


alias g="jump"
alias b="bookmark"
alias d="deletemark"
alias l="showmarks"
