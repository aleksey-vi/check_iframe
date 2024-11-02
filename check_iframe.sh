#!/bin/bash

# Specify the path to the file with subdomains
SUBDOMAINS_FILE="live_subdomains"

# Number of threads
THREADS=10

# Function to check subdomains
check_iframe() {
    local domain=$1
    
    # Perform curl and filter the results
    response=$(curl -I -s "https://$domain" | grep -i -E -v "x-frame-options:.*DENY|x-frame-options:.*SAMEORIGIN|frame-ancestors:.*self|frame-ancestors:.*none")
    
    if [ -n "$response" ]; then
        echo -e "\033[0;32m[ALLOWED] iframe loading is allowed: $domain\033[0m"
        echo "$domain" >> allowed_iframe_domains.txt
    else
        echo -e "\033[0;31m[RESTRICTED] iframe loading is restricted: $domain\033[0m"
    fi
}

export -f check_iframe

# Use xargs for multithreading, running check_iframe for each domain in the file
cat "$SUBDOMAINS_FILE" | xargs -P "$THREADS" -I {} bash -c 'check_iframe "$@"' _ {}

