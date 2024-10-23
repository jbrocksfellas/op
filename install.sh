#!/bin/bash

# Define the path for the executable
EXECUTABLE=op
TARGET_DIR="$HOME/.local/bin"  # Change this for different locations

# Create the target directory if it doesn't exist
mkdir -p $TARGET_DIR

# Move the executable to the target directory
cp "$PWD/dist/$EXECUTABLE" "$TARGET_DIR/$EXECUTABLE"

# Make the executable accessible
chmod +x "$TARGET_DIR/$EXECUTABLE"

# Add to PATH if not already included
if [[ ! "$PATH" == *"$TARGET_DIR"* ]]; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
  source ~/.bashrc
fi

echo "Installation complete! You can now use the 'op' command."
