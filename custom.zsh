# Manual setting
# ref: https://adamheins.com/blog/ctrl-p-in-the-terminal-with-fzf
fzf_then_open_in_the_editor() {
    local file=$(eval fd . --color=never | fzf-tmux --height 40% --exit-0)
    # open the file if exists
    if [ -f "$file" ]; then
        # Use the default editor if it is defined
        ${EDITOR:-vim} "$file" < /dev/tty
    elif [ -d "$file" ]; then
        cd "$file"
    fi
    zle reset-prompt
}

# Add homebrew
export PATH=/opt/homebrew/bin/:$PATH

zle     -N   fzf_then_open_in_the_editor
bindkey '^P' fzf_then_open_in_the_editor