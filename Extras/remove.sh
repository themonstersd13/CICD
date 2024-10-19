#!/bin/bash

# ----------------------------------------------------------------------------
# Remove Bun
# ----------------------------------------------------------------------------
if command -v bun &> /dev/null; then
    echo "Removing Bun..."
    rm -rf ~/.bun
else
    echo "Bun is not installed."
fi

# ----------------------------------------------------------------------------
# Stop Jenkins and Remove Jenkins
# ----------------------------------------------------------------------------
echo "Stopping Jenkins..."
sudo systemctl stop jenkins

echo "Removing Jenkins..."
sudo apt-get remove --purge -y jenkins

# ----------------------------------------------------------------------------
# Stop Docker and Remove Docker
# ----------------------------------------------------------------------------
echo "Stopping Docker..."
sudo systemctl stop docker

echo "Removing Docker..."
sudo apt-get remove --purge -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd

# ----------------------------------------------------------------------------
# Remove Java
# ----------------------------------------------------------------------------
echo "Removing Java..."
sudo apt-get remove --purge -y openjdk-21-jre-headless

# ----------------------------------------------------------------------------
# Remove Jenkins Keyring
# ----------------------------------------------------------------------------
echo "Removing Jenkins keyring..."
sudo rm -f /usr/share/keyrings/jenkins-keyring.asc
sudo rm -f /etc/apt/sources.list.d/jenkins.list

# ----------------------------------------------------------------------------
# Remove Docker Keyring and Repository
# ----------------------------------------------------------------------------
echo "Removing Docker keyring and repository..."
sudo rm -f /etc/apt/keyrings/docker.asc
sudo rm -f /etc/apt/sources.list.d/docker.list

# ----------------------------------------------------------------------------
# Clean up unnecessary packages
# ----------------------------------------------------------------------------
echo "Cleaning up unnecessary packages..."
sudo apt-get autoremove -y
sudo apt-get autoclean

echo "All components have been removed successfully."
