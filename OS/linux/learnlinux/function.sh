#!/bin/bash

# Function to check if a host is reachable using ping
check_ping() {
  local host="$1"

  # Input Validation: Check if an argument was provided
  if [ -z "$host" ]; then
    echo "Error: No IP address or hostname provided."
    return 1
  fi

  # Use ping with -c 1 to send only one packet
  # Redirect all command output to /dev/null to keep the script's output clean
  if ping -c 1 "$host" &> /dev/null; then
    echo "Host $host is reachable."
    return 0
  else
    echo "Host $host is unreachable."
    return 1
  fi
}

# --- Main script execution ---

# Check if a command-line argument was provided to the script
if [ -z "$1" ]; then
  echo "Usage: $0 <IP_address_or_hostname>"
  exit 1
fi

# Call the check_ping function with the first command-line argument
check_ping "$1"

