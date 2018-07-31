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
