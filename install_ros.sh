# Identical to official ROS 2 installation instructions
# https://docs.ros.org/en/rolling/Installation/Ubuntu-Install-Debians.html#id2
# Slight modifications are applied to prevent interaction with APT package manager
# - "export DEBIAN_FRONTEND=noninteractive", to ensure APT doesn't ask questions
# - "-E" flag, to ensure DEBIAN_FRONTEND environment variable is passed through to the sudo command
# - "-y" flag, to automate response to apt prompt


# Set DEBIAN_FRONTEND to noninteractive
export DEBIAN_FRONTEND=noninteractive

# Set locale
locale  # check for UTF-8
sudo -E apt update && sudo -E apt install -y locales
sudo -E locale-gen en_US en_US.UTF-8
sudo -E update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
locale  # verify settings

# Enable required repositories
sudo -E apt install -y software-properties-common
sudo -E add-apt-repository -y universe
sudo -E apt update && sudo -E apt install curl -y
sudo -E curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo -E tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Install development tools (optional)
sudo -E apt update && sudo -E apt install -y ros-dev-tools

# Install ROS 2
sudo -E apt update
sudo -E apt -y upgrade
sudo -E apt install -y ros-rolling-desktop
