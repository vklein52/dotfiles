#!/usr/bin/env bash

# This script installs the packages necessary for the system by installing
# python and pip specifically for each OS which are used to install ansible
# which is used to install the rest of the packages without needing
# OS-specific behavior. As well as any other 1-off packages.

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
    install-ansible
    ~/.local/bin/ansible-playbook ansible/site.yaml
}

function install-oh-my-zsh () {
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

run-ansible-playbook
install-oh-my-zsh
