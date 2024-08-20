#!/bin/bash

# Function to generate SSH key pair
generate_ssh_keys() {
    ssh-keygen -t rsa -b 4096 -C "your_email@domain.com"  
}

# Function to connect to instance and run command  
ssh_remote_command() {
    ssh -i /path/to/private_key.pem username@server_ip_or_dns uptime
}

# Function to securely copy file to instance
scp_file() {
    scp -i /path/to/private_key.pem /local/file.txt username@server:/remote/destination
}

# Function to forward remote port to local port
ssh_port_forward() {
    ssh -L 8888:remote_server:80 username@server_ip_or_dns
}

# Function to check SSH connection issues
debug_ssh() {
    # Check security group rules, NACLs, keys etc  
}