#!/bin/bash

# CLI (Command Line Interface) - A script accepting input like flags and arguments to control behavior.

# CLI tool to print a phrase multiple times

# times=$1
# phrase=$2

## A. Do the work
# Generate a phrase multiple times
phrase_generator(){
    for ((i=0; i<$times; i++)); do
        echo $phrase
    done
}

## B. Parses inputs from the cli
# Parse options
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -t|--times) times="$2"; shift ;;
        -p|--phrase) phrase="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

## C. Pass parsed inputs to the function and run everything
# Run the program
phrase_generator "$times" "$phrase"

# Run the script with a phrase and number of times to print it
# ./cli.sh -t 3 -p "Hello World"
# ./cli.sh --times 3 --phrase "Hello World"
# ./cli.sh -t 5 -p "Goodbye World"
