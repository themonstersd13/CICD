#! /bin/bash


#install apt docker
sudo bash ./Extras/installdocker.sh

#install jenkins
sudo bash ./Jenkins/install.sh


#install docker group
sudo bash ./Extras/usermod.sh


# Set the target directory path
TARGET_DIR="$HOME/Desktop/git"

# Create the target directory if it doesn't exist
if [ ! -d "$TARGET_DIR" ]; then
    echo "Creating target directory at $TARGET_DIR..."
    mkdir -p "$TARGET_DIR"
else
    echo "Target directory already exists at $TARGET_DIR."
fi

# Check if the file already exists in the target directory
ZIP_FILE="$TARGET_DIR/oh-my-git-linux.zip"
if [ -f "$ZIP_FILE" ]; then
    echo "File already exists in the target directory, skipping download."
else
    echo "Downloading and unzipping the file into $TARGET_DIR..."
    if wget https://github.com/thundersp/thundersp/releases/download/OSD/oh-my-git-linux.zip -O "$ZIP_FILE"; then
        unzip "$ZIP_FILE" -d "$TARGET_DIR"
        echo "File downloaded and unzipped successfully to $TARGET_DIR."
    else
        echo "Failed to download or unzip the file" >&2
        exit 1
    fi
fi
