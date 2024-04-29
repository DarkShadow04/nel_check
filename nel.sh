#!/bin/bash

# Define text color for banner
color=("\033[1;31m" "\033[1;32m" "\033[1;33m" "\033[1;34m" "\033[1;35m" "\033[1;36m" "\033[1;37m")
random_color=${color[$RANDOM % ${#color[@]}]}
reset='\033[0m'

# Print banner
echo -e "${random_color} nel script by: Dark_Shadow04 ${reset}\n"
echo -e "${random_color} https://github.com/DarkShadow04  ${reset}\n"
echo -e "${random_color} Copyright 2024 Dark_Shadow04 ${reset}\n"

# Introduction about NEL
INTRODUCTION="Network Error Logging (NEL) is an HTTP header that allows web servers to receive reports about network errors encountered by clients. This script fetches NEL header information for a specified URL/domain and saves the results into a text file with the URL/domain name."

# Function to fetch NEL header information from a given URL
function get_nel_info {
    url="$1"
    echo "Fetching NEL header information for $url..."
    domain=$(echo "$url" | awk -F[/:] '{print $4}')
    output_file="${domain}_report.txt"
    nel_header=$(curl -sI "$url" | grep -i "^nel:")
    if [ -z "$nel_header" ]; then
        echo "NEL header not found for $url"
        echo "NEL header not found for $url" >> "$output_file"
    else
        echo "NEL header found for $url:"
        echo "$nel_header"
        echo "$nel_header" >> "$output_file"
        echo "NEL header information saved to $output_file"
    fi
}

# Main function to prompt user for URL/domain and fetch NEL info
function main {
    # Print introduction about NEL with border and use lolcat for color
    echo -e "${INTRODUCTION}" | toilet -f term -F border | lolcat

    # Prompt user for URL/domain
    read -p "Enter the URL or domain: " user_input

    # Check if input is empty
    if [ -z "$user_input" ]; then
        echo "Error: No input provided"
        exit 1
    fi

    # Fetch NEL info
    get_nel_info "$user_input"

    # Solution to NEL-related issues
    SOLUTION="Solution: Ensure that NEL policies are properly configured and that the reporting endpoint is accessible and secure. Regularly monitor NEL reports to identify and address any network errors affecting user experience.\n\n"

    # Print solution to output file
    echo -e "$SOLUTION" >> "$output_file"

    echo "Script execution complete. Results saved to $output_file"
}

# Call main function
main

# Complete

echo -e "${random_color} Script executed successfully with blessing of Dark_Shadow04 ${reset}\n"
