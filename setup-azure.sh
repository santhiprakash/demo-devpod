#!/bin/bash

# Update package information
sudo apt-get update

# Create docker group if it doesn't exist
sudo groupadd docker || true

# Add devpod user to docker group
sudo usermod -aG docker devpod

# Create necessary directories with correct permissions
sudo mkdir -p /home/devpod/.docker
sudo mkdir -p /home/devpod/.gitconfig.d
sudo mkdir -p /home/devpod/.ssh

# Set proper ownership
sudo chown -R devpod:devpod /home/devpod/.docker
sudo chown -R devpod:devpod /home/devpod/.gitconfig.d
sudo chown -R devpod:devpod /home/devpod/.ssh

# Set proper permissions
sudo chmod 700 /home/devpod/.ssh
sudo chmod 644 /home/devpod/.gitconfig

# Ensure Docker socket has correct permissions
sudo chmod 666 /var/run/docker.sock
