FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install essential tools
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        curl \
        git \
        sudo \
        docker.io \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Create devpod user and set up permissions
ARG USERNAME=devpod
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Create workspace directory
RUN mkdir -p /workspace \
    && chown -R $USERNAME:$USERNAME /workspace

# Create necessary dot directories
RUN mkdir -p /home/$USERNAME/.docker \
    && mkdir -p /home/$USERNAME/.gitconfig.d \
    && mkdir -p /home/$USERNAME/.ssh \
    && chown -R $USERNAME:$USERNAME /home/$USERNAME/.docker \
    && chown -R $USERNAME:$USERNAME /home/$USERNAME/.gitconfig.d \
    && chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh

WORKDIR /workspace

# Switch to non-root user
USER $USERNAME

# Set environment variables
ENV DOCKER_BUILDKIT=1
ENV COMPOSE_DOCKER_CLI_BUILD=1
