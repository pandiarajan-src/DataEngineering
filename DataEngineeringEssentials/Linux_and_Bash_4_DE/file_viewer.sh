#!/bin/bash

# help function to display usage information
function usage() {
    echo "Usage: $0 [option] [file_name]"
    echo
    echo "Options:"
    echo "  -h, --help:     Display usage information."
    echo
    echo "Arguments:"
    echo "  file_name: The name of the file to read."
    echo "  If no file_name is provided, the script will prompt the user to enter the file name."
    echo "  If the file does not exist, the script will exit with an error code."
    echo "  The script will print the contents of the file and show the file information."
    echo
    echo "Examples:"
    echo "  $0 my_file.txt"
    echo "  $0"
}

# Check if the user has provided an argument
if [ $# -eq 0 ]; then
    # Read the input file name from the user if input argument is empty
    read -p "No file provided as an input, please provide the file name to read:" FILE
elif [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    usage
    exit 0
else
    # Use the provided argument as the file name
    FILE="$1"
fi

# Check if the file exists
if [ ! -f "$FILE" ]; then
    echo "File does not exist: $FILE"
    echo "Use -h or --help for help."
    echo "Exiting..."
    exit 1
fi

# Print the contents of the file
echo "Contents of $FILE:"
cat "$FILE"

# # Show the file info
# echo "File information:"
# ls -l "$FILE"

# Detect the operating system
os_type=$(uname)
if [[ "$os_type" == "Darwin" ]]; then
    # macOS
    # Get the file size
    file_size=$(stat -f "%z" "$FILE")
    # Get the modified date
    modified_date=$(stat -f "%Sm" "$FILE")
elif [[ "$os_type" == "Linux" ]]; then
    # Linux
    # Get the file size
    file_size=$(stat -c%s "$FILE")
    # Get the modified date
    modified_date=$(stat -c %y "$FILE" | awk '{print $1}')
else
    # Unsupported operating system
    echo "Unsupported operating system: $os_type"
    exit 1
fi

# Print the file size and modified date
echo
echo "File size: $file_size bytes"
echo "Modified date: $modified_date"
exit 0
