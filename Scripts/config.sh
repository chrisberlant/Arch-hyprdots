#!/bin/bash

# Configuration script to install basic apps

# Check if the user is root
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Function to check if a package is installed
package_installed() {
    pacman -Q "$1" &>/dev/null
}

# Install ufw if not already installed
if ! package_installed ufw; then
    echo "Installing ufw..."
    pacman -S --noconfirm ufw
	# Enable ufw
	ufw enable
	# Default deny incoming connections
	ufw default deny incoming
	echo "ufw configuration completed. Incoming connections are now denied by default."
	# Start the firewall
	systemctl start ufw.service
	echo "Firewall started"
else
    echo "ufw is already installed."
fi




# Install Firefox if not already installed
if ! package_installed firefox; then
    echo "Installing Firefox..."
    pacman -S --noconfirm firefox
	echo "Firefox installation completed."
else
    echo "Firefox is already installed."
fi


# Install TLP if not already installed
if ! package_installed tlp; then
    echo "Installing TLP..."
    pacman -S --noconfirm tlp
	echo "TLP installation completed."
else
    echo "TLP is already installed."
fi


