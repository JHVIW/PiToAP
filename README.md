# WiFi Access Point Setup Script

This script automates the setup of a WiFi Access Point (AP) on a Raspberry Pi or similar device using `hostapd` and `dnsmasq`. It simplifies the process of turning your device into a wireless access point for other devices to connect to.

## Prerequisites

Before running this script, ensure that you have:
- A compatible device such as a Raspberry Pi.
- A fresh installation of Raspbian or a similar Debian-based Linux distribution.
- Internet access on your device.
- Basic knowledge of using the command line interface.

## Usage

1. Download the script to your device.
2. Run the script with elevated privileges using `sudo sh script.sh`.

## Instructions

The script performs the following actions:
1. Updates the package lists and installs `hostapd` and `dnsmasq`.
2. Stops the services before configuring.
3. Configures `hostapd` by creating a configuration file at `/etc/hostapd/hostapd.conf`.
4. Points `hostapd` to the configuration file.
5. Configures `dnsmasq` by creating a configuration file at `/etc/dnsmasq.conf` with a specified DHCP range.
6. Configures a static IP for `wlan0` in `/etc/dhcpcd.conf`.
7. Restarts the services to apply the changes.

## Note

- Ensure that you replace `YOUR_NETWORK_NAME_HERE` and `YOUR_PASSWORD_HERE` with your desired network name (SSID) and password respectively.
- This script assumes that your wireless interface is `wlan0`. If it's different, please modify the script accordingly.

## Disclaimer

This script is provided as-is and without warranty. Use it at your own risk. Ensure that you have backed up any important data before running this script.
