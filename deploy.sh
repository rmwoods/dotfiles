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
#. .gnome-shortcuts.sh

# python
IPYTHON_DIR=~/.ipython
MATPLOTLIBRC_DIR=~/.config/matplotlib
MATPLOTLIBRC=${MATPLOTLIBRC_DIR}/matplotlibrc

mkdir -p $IPYTHON_DIR
backup $IPYTHON_DIR

mkdir -p $MATPLOTLIBRC_DIR
backup $MATPLOTLIBRC

ln -s $PWD/ipython $IPYTHON_DIR
ln -s $PWD/matplotlibrc $MATPLOTLIBRC

# VIM
VIMRC=~/.vimrc
VIM_DIR=~/.vim

mkdir -p $VIM_DIR
backup $VIM_DIR
ln -s $PWD/vim $VIM_DIR

backup $VIMRC
ln -s $PWD/vimrc $VIMRC

# Git
GIT=~/.gitconfig

backup $GIT
ln -s $PWD/gitconfig $GIT

# Install git submodules
git submodule init
git submodule update

VIM_BLACK=vim/bundle/black.vim/plugin/
mkdir -p $VIM_BLACK
cd $VIM_BLACK
wget https://raw.githubusercontent.com/python/black/master/plugin/black.vim
cd $PWD
