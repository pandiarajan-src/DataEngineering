#!/bin/bash

# CLI (Command Line Interface) - A script accepting input like flags and arguments to control behavior.

# CLI tool to print a phrase multiple times  
times=$1
phrase=$2

for ((i=0; i<$times; i++)); do
    echo $phrase
done