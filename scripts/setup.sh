#!/bin/bash

# This script is intended to be a monolith script that creates a configuration with various specifications.
# First, it ensures Python and PIP are installed, and uses PIP to install Ansible.
# Next, an Ansible playbook is kicked off, targetting localhost, using the package module to install essentials such as emacs and zsh
# Lastly, it clones the git repo (TODO)

function determine-os () {
    UNAME_OUT=`uname -a`
    for OS in "MANJARO" "ARCH" "UBUNTU"; do
        if grep -i "$OS" <(echo "$UNAME_OUT"); then
            echo "$OS" 1>&2
        fi
    done
}

function install-python-and-pip () {
    OS=`determine-os 2>&1 >/dev/null`
    if [ "$OS" == "MANJARO" ] || [ "$OS" == "ARCH" ]; then
        sudo pacman -Syu --noconfirm python python-pip
    elif [ "$OS" == "UBUNTU" ]; then
        sudo apt-get update -y
        sudo apt-get install python3 python3-pip -y
    else
        echo "Unsupported OS: ${OS}"       
    fi
}

function install-ansible () {
    install-python-and-pip
    python -m pip install --user ansible
}

function run-ansible-playbook () {
    # install-ansible
    ~/.local/bin/ansible-playbook install_packages/site.yaml
}

# install-python-and-pip
run-ansible-playbook
