#!/bin/bash

# Create the docker group if it doesn't exist
if ! getent group docker > /dev/null; then
  echo "Creating docker group..."
  sudo groupadd docker
else
  echo "Docker group already exists."
fi

# Add the current user to the docker group
echo "Adding current user to the docker group..."
sudo usermod -aG docker $USER

# Add the Jenkins user to the docker group
echo "Adding Jenkins user to the docker group..."
sudo usermod -aG docker jenkins

# Restart Jenkins service
echo "Starting Jenkins service..."
sudo systemctl start jenkins

#Stop Mongodb
sudo systemctl stop mongod || sudo pkill -f mongod
sudo systemctl stop mongo|| sudo pkill -f mongo


echo "Script execution completed. You may need to log out and log back in for changes to take effect."
