FROM mcr.microsoft.com/devcontainers/javascript-node:latest

# Configure non-root user
ARG USERNAME=node
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Install essential tools
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        curl \
        git \
        ssh \
        sudo \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Ensure proper Git configuration directory structure
RUN mkdir -p /home/node/.config \
    && touch /home/node/.gitconfig \
    && chown -R node:node /home/node/.config \
    && chown node:node /home/node/.gitconfig

# Create and set up workspace directory
WORKDIR /workspace
RUN chown ${USERNAME}:${USERNAME} /workspace

# Ensure the node user has sudo access
RUN echo "node ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/node \
    && chmod 0440 /etc/sudoers.d/node

# Switch to non-root user
USER node

# Set environment variables
ENV DEVCONTAINER=true \
    NODE_ENV=development
