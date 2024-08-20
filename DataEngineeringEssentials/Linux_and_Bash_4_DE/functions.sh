#!/bin/bash

# Function - A reusable section of bash logic defined once and called multiple times. Functions allow code reuse.
backup_docs(){
    tar -cvzf /backups/documents.tar.gz /documents
}

# Call the backup function 
backup_docs
