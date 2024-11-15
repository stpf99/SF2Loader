#!/bin/bash

# Update system and install necessary packages
sudo pacman -Syyu python-pip fluidsynth soundfont-fluid

# Create configuration directory if it doesn't exist
mkdir -p ~/.config/pip/

# Check if pip.conf exists and has the correct global entry
PIP_CONF=~/.config/pip/pip.conf
if [ -f "$PIP_CONF" ]; then
    if grep -q 'break-system-packages = true' "$PIP_CONF"; then
        echo "pip.conf already has the correct entry."
    else
        echo '[global]
break-system-packages = true' >> "$PIP_CONF"
        echo "Added 'break-system-packages = true' to pip.conf."
    fi
else
    echo '[global]
break-system-packages = true' > "$PIP_CONF"
    echo "Created pip.conf with the necessary entry."
fi

# Prompt user to log in again
echo "Please log in to the system again."

# Install necessary Python packages with specific versions
pip3 install flask==3.0.3 PyFluidSynth==1.3.3 sf2utils==1.0.0

# Execute additional script
sudo ./install_sf2loader.sh

sudo iptables -A OUTPUT -p tcp --dport 5000 -j ACCEPT
sudo iptables -A OUTPUT -p udp --dport 5000 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 5000 -j ACCEPT
sudo iptables -A INPUT -p udp --dport 5000 -j ACCEPT

sudo iptables-save | sudo tee /etc/iptables/iptables.rules

systemctl restart iptables
