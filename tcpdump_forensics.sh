#!/bin/bash

LOG_FILE="tcpdump_log.txt"

# Function to capture network traffic with tcpdump
capture_traffic() {
    read -p "Enter the network interface to capture packets (e.g., eth0): " interface
    read -p "Enter the tcpdump filter expression: " filter
    read -p "Enter the number of packets to capture: " packet_count
    read -p "Enter the output file name (e.g., capture.pcap): " output_file

    echo "Capturing network traffic on interface $interface..." | tee -a "$LOG_FILE"
    tcpdump -i "$interface" -w "$output_file" "$filter" -c "$packet_count" | tee -a "$LOG_FILE"

    echo "Packet capture saved to '$output_file'." | tee -a "$LOG_FILE"
}

# Function to read packets from a pcap file and apply a display filter
read_pcap_file() {
    read -p "Enter the pcap file to read packets from: " pcap_file
    read -p "Enter the display filter expression: " display_filter

    echo "Reading packets from '$pcap_file'..." | tee -a "$LOG_FILE"
    tcpdump -r "$pcap_file" "$display_filter" | tee -a "$LOG_FILE"
}

# Function to perform real-time statistical analysis using tshark
perform_statistical_analysis() {
    read -p "Enter the network interface to capture packets (e.g., eth0): " interface
    read -p "Enter the number of packets to capture: " packet_count

    echo "Performing real-time statistical analysis on interface $interface..." | tee -a "$LOG_FILE"
    tcpdump -i "$interface" -w - -c "$packet_count" | tshark -r - -qz io,phs | tee -a "$LOG_FILE"
}

# Display the menu options
display_menu() {
    clear
    echo "TCPDump Network Forensics - Menu"
    echo "1. Capture network traffic with tcpdump"
    echo "2. Read packets from a pcap file and apply a display filter"
    echo "3. Perform real-time statistical analysis using tshark"
    echo "4. Exit"
    echo
    read -p "Enter your choice (1-4): " choice
    echo

    case $choice in
        1) capture_traffic ;;
        2) read_pcap_file ;;
        3) perform_statistical_analysis ;;
        4) exit ;;
        *) echo "Invalid choice. Please enter a number from 1 to 4." ;;
    esac

    echo
    read -p "Press Enter to continue..."
    display_menu
}

# Start the menu
display_menu
