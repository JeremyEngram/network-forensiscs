#!/bin/bash

# Function to filter traffic to or from a specific IP address
filter_by_ip() {
    read -p "Enter the IP address: " ip_address
    echo "Filter: ip.addr == $ip_address"
}

# Function to filter traffic from a specific IP address
filter_by_source_ip() {
    read -p "Enter the source IP address: " source_ip
    echo "Filter: ip.src == $source_ip"
}

# Function to filter traffic to a specific IP address
filter_by_destination_ip() {
    read -p "Enter the destination IP address: " dest_ip
    echo "Filter: ip.dst == $dest_ip"
}

# Function to filter traffic from a specific port
filter_by_source_port() {
    read -p "Enter the source port number: " source_port
    echo "Filter: tcp.srcport == $source_port"
}

# Function to filter traffic to a specific port
filter_by_destination_port() {
    read -p "Enter the destination port number: " dest_port
    echo "Filter: tcp.dstport == $dest_port"
}

# Function to filter traffic based on a specific protocol
filter_by_protocol() {
    read -p "Enter the protocol: " protocol
    echo "Filter: $protocol"
}

# Function to filter traffic based on a specific protocol and IP address
filter_by_protocol_and_ip() {
    read -p "Enter the IP address: " ip_address
    read -p "Enter the protocol: " protocol
    echo "Filter: ip.addr == $ip_address && $protocol"
}

# Display the menu options
display_menu() {
    clear
    echo "Wireshark Display Filters - Menu"
    echo "1. Filter traffic to or from a specific IP address"
    echo "2. Filter traffic from a specific IP address"
    echo "3. Filter traffic to a specific IP address"
    echo "4. Filter traffic from a specific port"
    echo "5. Filter traffic to a specific port"
    echo "6. Filter traffic based on a specific protocol"
    echo "7. Filter traffic based on a specific protocol and IP address"
    echo "8. Exit"
    echo
    read -p "Enter your choice (1-8): " choice
    echo

    case $choice in
        1) filter_by_ip ;;
        2) filter_by_source_ip ;;
        3) filter_by_destination_ip ;;
        4) filter_by_source_port ;;
        5) filter_by_destination_port ;;
        6) filter_by_protocol ;;
        7) filter_by_protocol_and_ip ;;
        8) exit ;;
        *) echo "Invalid choice. Please enter a number from 1 to 8." ;;
    esac

    echo
    read -p "Press Enter to continue..."
    display_menu
}

# Start the menu
display_menu
