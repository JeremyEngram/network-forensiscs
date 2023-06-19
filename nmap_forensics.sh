#!/bin/bash

LOG_FILE="nmap_scan.log"

read -p "Enter the target IP address or range: " target
read -p "Enter the port range to scan (e.g., 1-1000): " port_range

# Identify live hosts on the network
echo "Scanning for live hosts..." | tee -a "$LOG_FILE"
nmap -sn "$target" | tee -a "$LOG_FILE"

# Perform port scanning
echo "Performing port scanning on $target..." | tee -a "$LOG_FILE"
nmap -p "$port_range" "$target" | tee -a "$LOG_FILE"

# Perform version detection
echo "Performing version detection on $target..." | tee -a "$LOG_FILE"
nmap -sV "$target" | tee -a "$LOG_FILE"

# Scan for operating system detection
echo "Scanning for operating system on $target..." | tee -a "$LOG_FILE"
nmap -O "$target" | tee -a "$LOG_FILE"

echo "Scan results saved to '$LOG_FILE'."
read -p "Press Enter to exit."
