#!/bin/bash

# setup_alice.sh
# CSC820 - Lab 13A | Least Privilege Principle
# Authored by: Cooper Wiegand & GPT-4o

# Create a new user Alice_CSC820 without sudo privileges
USERNAME="Alice_CSC820"
PASSWORD="Password1!"

echo "Creating $USERNAME:$PASSWORD"
sudo useradd -m -s /bin/bash "$USERNAME"

# Configure sudoers to allow only timedatectl for Alice_CSC820
echo "Configuring sudoers to allow $USERNAME to use timedatectl..."
SUDOERS_FILE="/etc/sudoers.d/$USERNAME"
echo "$USERNAME ALL=(ALL) NOPASSWD: /usr/bin/timedatectl" | sudo tee "$SUDOERS_FILE" > /dev/null

# Set appropriate permissions on the sudoers file
sudo chmod 440 "$SUDOERS_FILE"

echo "Setup complete. User $USERNAME can now run 'sudo timedatectl'."
echo "Verify with: sudo -l -U $USERNAME"
