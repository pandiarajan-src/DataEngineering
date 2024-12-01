#!/bin/bash

# Declare an array with "apple", "bear", and "Cherry"
declare -a fruits=("apple" "bear" "Cherry")

# Loop through the array and print each element
for fruit in "${fruits[@]}"; do
    echo "This $fruit is delicious!!!"
done