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

# Setup workspace and permissions
RUN mkdir -p /workspace \
    && chown ${USERNAME}:${USERNAME} /workspace \
    && echo "${USERNAME} ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME}

# Set up Git configuration
RUN mkdir -p /home/${USERNAME}/.config/git \
    && chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}/.config

# Set workspace as working directory
WORKDIR /workspace

# Switch to non-root user
USER ${USERNAME}

# Set environment variables
ENV DEVCONTAINER=true \
    NODE_ENV=development \
    PATH="${PATH}:/workspace/node_modules/.bin"
