#!/usr/bin/env bash

function clone-repo () {
    pushd ~
    mkdir -p $HOME/.cfg
    git init --bare $HOME/.cfg
    git --git-dir=$HOME/.cfg --work-tree=$HOME remote add origin https://github.com/vklein52/dotfiles.git 
    git --git-dir=$HOME/.cfg --work-tree=$HOME pull origin master
    popd
}

# Assumes repo has been cloned in the home directory
function install-packages () {
    pushd ~/scripts
    ./install_packages.sh
    popd
}

function setup () {
    clone-repo
    install-packages
}

setup
