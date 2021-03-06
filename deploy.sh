#!/bin/bash

# This script sym-links all of the configuration files in this directory to the
# location they should be

PWD=`pwd`

backup(){
    if [ -e $1 ]
    then
        mv $1 $1.bak
    fi
}

# bash
BASHRC=~/.bashrc
ALIASES=~/.bash_aliases

backup $BASHRC
backup $ALIASES

ln -s $PWD/bashrc $BASHRC
ln -s $PWD/bash_aliases $ALIASES

# Shortcuts
. .gnome-shortcuts.sh

# python
IPYTHON=~/.ipython
MATPLOTLIBRC=~/.config/matplotlib/matplotlibrc

backup $IPYTHON
backup $MATPLOTLIBRC

ln -s $PWD/ipython $IPYTHON
ln -s $PWD/matplotlibrc $MATPLOTLIBRC

# VIM
VIMRC=~/.vimrc
VIM=~/.vim

backup $VIM
backup $VIMRC # Uncomment once this is finished
ln -s $PWD/vim $VIM
ln -s $PWD/vimrc $VIMRC # Uncomment once this is finished

# Git
GIT=~/.gitconfig

backup $GIT
ln -s $PWD/gitconfig $GIT

# Install git submodules
git submodule init
git submodule update

mkdir -p vim/bundle/black.vim/plugin/
cd vim/bundle/black.vim/plugin/
wget https://raw.githubusercontent.com/python/black/master/plugin/black.vim
