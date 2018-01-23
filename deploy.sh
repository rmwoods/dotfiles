#!/bin/bash

# This script sym-links all of the configuration files in this directory to the location they should be

PWD=`pwd`
BASHRC=~/.bashrc
ALIASES=~/.bash_aliases

backup(){
    if [ -e $1 ]
    then
        mv $1 $1.bak
    fi
}

# bash
backup $BASHRC
backup $ALIASES

ln -s $PWD/bashrc $BASHRC
ln -s $PWD/bash_aliases $ALIASES
