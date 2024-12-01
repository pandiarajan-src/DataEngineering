#!/bin/bash

# Function to search files for text 
# This function searches recursively for a given text pattern ($1) in the current directory (.) using grep.
search_text(){
  grep -r "$1" .
}

# Function to extract columns from file
# This function extracts specified columns ($1) from a given file ($2) using cut.
extract_columns(){  
  cut -f"$1" "$2"
}

# Function to remove duplicates
# This function removes duplicate lines from a given file ($1) using uniq.
uniq_lines(){
  uniq "$1"  
}

# Search for 'error' in all files 
search_text error

# Extract first 5 columns from data.csv
extract_columns 1-5 data.csv

# Remove duplicate lines from file.txt
uniq_lines file.txt