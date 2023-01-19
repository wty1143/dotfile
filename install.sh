#!/bin/zsh

# install prerequisites
brew install ctags
brew install fd
brew install fzf
brew install tmux
brew install ripgrep
brew install python

declare -a arr=(vim
                vimrc
                tmux.conf
                custom.zsh
                )

# Copy the original one to {FILE}.old
for VAR in "${arr[@]}"
do
    test -e $HOME/.${VAR} && ! test -L $HOME/.${VAR} && mv $HOME/.${VAR} $HOME/.${VAR}.old
    ln -s -f $PWD/${VAR} $HOME/.${VAR}
done

echo source ~/.custom.zsh >> ~/.zshrc
