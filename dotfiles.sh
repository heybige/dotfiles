#!/bin/bash

if [ -d ~/.dotfiles ]; then
    # Check if ~/.dotfiles is empty or has stuff in it
    echo "~/.dotfiles exists - aborting.."
    exit
fi

path_to_git=$(which git)
if [ ! -x "$path_to_git" ] ; then
    sudo apt-get -y install git
fi

git clone https://github.com/heybige/dotfiles.git ~/.dotfiles

if [ ! -f ~/.bash_aliases ]; then
    ln -s ~/.dotfiles/.bash_aliases
fi

if [ ! -f ~/.exrc ]; then
    ln -s ~/.dotfiles/.exrc
fi

if [ ! -f ~/.gitignore ]; then
    ln -s ~/.dotfiles/.gitignore
fi

if [ ! -f ~/.vimrc ]; then
    ln -s ~/.dotfiles/.vimrc
fi

# reload .bashrc to load .bash_aliases
. ~/.bashrc
