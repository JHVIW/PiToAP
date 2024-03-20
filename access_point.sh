#!/bin/bash

# Update and install hostapd and dnsmasq
sudo apt-get update
sudo apt-get install -y hostapd dnsmasq

# Stop the services before configuring
sudo systemctl stop hostapd
sudo systemctl stop dnsmasq

# Configure hostapd
cat > /etc/hostapd/hostapd.conf <<EOF
interface=wlan0
driver=nl80211
ssid=YOUR_NETWORK_NAME_HERE
hw_mode=g
channel=7
wmm_enabled=0
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_passphrase=YOUR_PASSWORD_HERE
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP
rsn_pairwise=CCMP
EOF

# Point hostapd to the configuration file
sed -i 's:#DAEMON_CONF="":DAEMON_CONF="/etc/hostapd/hostapd.conf":' /etc/default/hostapd

# Configure dnsmasq
mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
cat > /etc/dnsmasq.conf <<EOF
interface=wlan0
dhcp-range=192.168.4.2,192.168.4.20,255.255.255.0,24h
EOF

# Configure a static IP for wlan0
cat >> /etc/dhcpcd.conf <<EOF
interface wlan0
static ip_address=192.168.137.79/24
nohook wpa_supplicant
EOF

# Restart the services
sudo service dhcpcd restart
sudo systemctl reload dnsmasq
sudo systemctl unmask hostapd
sudo systemctl enable hostapd
sudo systemctl start hostapd

echo "WiFi Access Point setup is complete. SSID: YOUR_NETWORK_NAME_HERE"
