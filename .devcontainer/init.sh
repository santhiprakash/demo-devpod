#!/bin/bash

# Create proper Git configuration
if [ ! -f ~/.gitconfig ]; then
    touch ~/.gitconfig
    git config --global init.defaultBranch main
    git config --global user.name "DevPod User"
    git config --global user.email "devpod@example.com"
fi

# Ensure proper SSH directory permissions
mkdir -p ~/.ssh
chmod 700 ~/.ssh
