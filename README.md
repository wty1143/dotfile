# **dotfile**

# Installation (Suppose using MacOS)
---
## tmux

```zsh
# Tmux version >=  2.1 
cd dotfile
# The default prefix is Ctrl+A
ln -s -f $PWD/tmux.conf ~/.tmux.conf
```

## fonts
``` zsh
# ref https://github.com/powerline/fonts.git
cd dotfile
./install.sh
# After installation complete, go the preference to set the font
# In my example, I use the Meslo LG M on PowerShell
```

## git
```zsh
# ref: https://coderwall.com/p/euwpig/a-better-git-log
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
```

## Oh My Zsh
```zsh
# ref: https://gist.github.com/DukeNgn/9312a65e1535b3b1bffd9fed2c892079
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## FZF
```zsh
brew install fzf

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

# After the command above, source to take effect
source ~/.zshrc
```

## Oh my Zsh (default plugin)
```zsh
# https://www.zhihu.com/question/49284484
vim ~/.zshrc
# Fill the plugin you want, ... represent other Zsh plugins you may have installed.
plugin=(... git extract gitignore)
```

## Oh My Zsh (third-party plugin)
```zsh
# ref: https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# ref: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

vim ~/.zshrc
# ... represent other Zsh plugins you may have installed.
plugin=(... zsh-autosuggestions zsh-syntax-highlighting)
```
