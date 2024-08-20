#!/bin/bash

# Function to truncate file preview
function preview_file() {
    # Print first 5 lines
    head -n 5 "$1"

    # Print last 5 lines
    tail -n 5 "$1"
}

# Script entry point
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    if [[ $# -ne 1 ]]; then
        echo "Usage: ${0} <file>"
        exit 1
    fi
    file="$1"

    preview_file "$file"
fi