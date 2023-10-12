# Hardcode these IDs, just for testing. Read these in as arguments later.
export USERNAME=user
export USER_UID=1000
export USER_GID=$USER_UID

# Set DEBIAN_FRONTEND to noninteractive
export DEBIAN_FRONTEND=noninteractive

# Add vscode user with same UID and GID as your host system
# (copied from https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user#_creating-a-nonroot-user)
groupadd --gid $USER_GID $USERNAME
useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME
apt-get update
apt-get install -y sudo
echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME
chmod 0440 /etc/sudoers.d/$USERNAME
