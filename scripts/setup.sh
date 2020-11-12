#!/usr/bin/env bash

function clone-repo () {
    pushd ~
    git init
    git remote add origin https://github.com/vklein52/dotfiles.git 
    git pull origin master
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
