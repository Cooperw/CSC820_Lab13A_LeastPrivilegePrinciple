#!/bin/bash

# setup_alice.sh
# CSC820 - Lab 13A | Least Privilege Principle
# Authored by: Cooper Wiegand & GPT-4o

USERNAME="Alice_CSC820"
PASSWORD="Password1!"

echo "Creating $USERNAME:$PASSWORD"
sudo useradd -m -s /bin/bash "$USERNAME"
SUDOERS_FILE="/etc/sudoers.d/$USERNAME"
sudo chmod 440 "$SUDOERS_FILE"

echo "Setup Complete. Verify 'timedatectl' appears with: sudo -l -U $USERNAME"
