#!/bin/sh

mv -f ~/dotfiles ~/.dotfiles

ln -svf ~/.dotfiles/vimrc ~/.vimrc
ln -svf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -svf ~/.dotfiles/gitconfig ~/.gitconfig
ln -svf ~/.dotfiles/zshrc ~/.zshrc
ln -svf ~/.dotfile/holokai.vim ~/.vim/bundle/color-scheme-holokai-for-vim/colors/holokai.vim
