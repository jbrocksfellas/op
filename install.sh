#!/bin/bash

# Define the path for the executable
EXECUTABLE=op
TARGET_DIR="$HOME/.local/bin"  # Change this for different locations
DOWNLOAD_URL="https://github.com/jbrocksfellas/op/raw/refs/heads/master/dist/op"

# Create the target directory if it doesn't exist
mkdir -p $TARGET_DIR
mkdir -p $HOME/.op

# Download the executable
echo "Downloading $EXECUTABLE from $DOWNLOAD_URL..."
if command -v curl &> /dev/null; then
  curl -L -o "$TARGET_DIR/$EXECUTABLE" "$DOWNLOAD_URL"
elif command -v wget &> /dev/null; then
  wget -O "$TARGET_DIR/$EXECUTABLE" "$DOWNLOAD_URL"
else
  echo "Error: Neither curl nor wget is installed. Please install one to proceed."
  exit 1
fi

# Make the executable accessible
chmod +x "$TARGET_DIR/$EXECUTABLE"

# Add to PATH if not already included
if [[ ! "$PATH" == *"$TARGET_DIR"* ]]; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
  source ~/.bashrc
fi

echo "Installation complete! You can now use the 'op' command."
