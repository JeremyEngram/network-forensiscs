import pyshark

# Step 1: Capture Network Traffic
capture = pyshark.LiveCapture(interface='eth0')
capture.sniff(timeout=10)  # Capture traffic for 10 seconds
capture.save('capture.pcap')  # Save captured packets to a pcap file

# Step 2: Analyze Captured Traffic
cap = pyshark.FileCapture('capture.pcap')

# Example: Print source and destination IP addresses of captured packets
for packet in cap:
    if 'IP' in packet:
        print(f"Source IP: {packet['IP'].src} | Destination IP: {packet['IP'].dst}")

# Step 3: Follow TCP Streams
# Example: Print contents of TCP streams
for packet in cap:
    if 'TCP' in packet:
        print(packet['TCP'].payload)

# Step 4: Export and Report
# Example: Export packet summary to a CSV file
with open('report.csv', 'w') as file:
    file.write("Frame Number,Source IP,Destination IP,TCP Port\n")
    for packet in cap:
        if 'IP' in packet and 'TCP' in packet:
            frame_number = packet.frame_info.number
            src_ip = packet['IP'].src
            dst_ip = packet['IP'].dst
            tcp_port = packet['TCP'].dstport
            file.write(f"{frame_number},{src_ip},{dst_ip},{tcp_port}\n")

cap.close()
