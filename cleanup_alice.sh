#!/bin/bash

# cleanup_alice.sh
# CSC820 - Lab 13A | Least Privilege Principle
# Authored by: Cooper Wiegand & GPT-4o

# Variables
USERNAME="Alice_CSC820"
SUDOERS_FILE="/etc/sudoers.d/$USERNAME"

echo "Starting cleanup process..."

# Check if the user exists
if id "$USERNAME" &>/dev/null; then
    echo "Removing user $USERNAME and their home directory..."
    sudo userdel -r "$USERNAME"
    echo "User $USERNAME has been removed."
else
    echo "User $USERNAME does not exist. Skipping user deletion."
fi

# Remove the sudoers file if it exists
if [ -f "$SUDOERS_FILE" ]; then
    echo "Removing sudoers configuration for $USERNAME..."
    sudo rm -f "$SUDOERS_FILE"
    echo "Sudoers file for $USERNAME has been removed."
else
    echo "Sudoers file for $USERNAME does not exist. Skipping file removal."
fi

echo "Cleanup process completed. The system has been restored to its secure state."
