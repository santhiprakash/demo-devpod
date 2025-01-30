#!/bin/bash

# Create proper Git configuration
if [ ! -f ~/.gitconfig ]; then
    touch ~/.gitconfig
    git config --global init.defaultBranch main
    git config --global user.name "Prakash"
    git config --global user.email "b.santhiprakash@gmail.com"
fi

# Ensure proper SSH directory permissions
mkdir -p ~/.ssh
chmod 700 ~/.ssh
