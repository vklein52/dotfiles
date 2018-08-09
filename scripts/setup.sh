#!/bin/bash

# This script is intended to be a monolith script that creates a configuration with various specifications.
# First, it ensures Python and PIP are installed, and uses PIP to install Ansible.
# Next, an Ansible playbook is kicked off, targetting localhost, using the package module to install essentials such as emacs and zsh
# It then runs a variety of commands installing extras such as Spacemacs and oh-my-zsh on top of the installed binaries.
# Lastly, it clones the git repo
