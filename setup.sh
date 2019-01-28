#!/bin/sh

sudo apt install git zsh vim tmux
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mv -f ~/dotfiles ~/.dotfiles

ln -svf ~/.dotfiles/vimrc ~/.vimrc
ln -svf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -svf ~/.dotfiles/gitconfig ~/.gitconfig
ln -svf ~/.dotfiles/zshrc ~/.zshrc

vim +PluginInstall +qall
