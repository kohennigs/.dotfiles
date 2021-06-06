#!/usr/bin env bash

# ensure dirs are present
mkdir -p ~/.config/nvim/plugin
mkdir -p ~/.config/nvim/after
mkdir -p ~/.config/nvim/lua

# link all from git repos
for f in `find . -regex ".*\.vim\|.*\.lua$"`; do
    rm -rf ~/.config/nvim/$f
    ln -s ~/koh-git/dotfiles/.config/nvim/$f ~/.config/nvim/$f
done
