#!/bin/bash

# Array - An ordered, integer-indexed bash data structure for storing multiple values.
files=(/etc/hosts /etc/profile /etc/bashrc)

for file in "${files[@]}"; do
    ls -l "$file"
done