# Manual setting
# ref: https://adamheins.com/blog/ctrl-p-in-the-terminal-with-fzf
fzf_then_open_in_the_editor() {
    local file=$(eval fd . --color=always | fzf-tmux --height 40% --exit-0)
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

# FZF bindings
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

alias ctags="`brew --prefix`/bin/ctags"