#!/bin/bash

## Basic structure
# function_name()
# {
#     commands
# }

# mimic function that accepts two parameters
mimic()
{
    echo "First Parameter: $1"
    echo "Second Parameter: $2"
}

mimic 1 2
mimic 90 100

# # Function - A reusable section of bash logic defined once and called multiple times. Functions allow code reuse.
# backup_docs(){
#     tar -cvzf /backups/documents.tar.gz /documents
# }

# # Call the backup function 
# backup_docs
