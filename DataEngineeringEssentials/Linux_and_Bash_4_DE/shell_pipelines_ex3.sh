#!/bin/bash

# This script is a part of a challenge quesions from Data Engineering Essentials

# Part 1: Pipe the output of ls to wc -l to count files in the home directory
# How many files are in the home directory?
ls -l $HOME | wc -l

# Part 2: Redirect the output of pwd to a file called location.txt.
pwd > location.txt

# Part 3: Echo a message only if a certain file exists using conditional execution.
[ -f $0 ] && echo "Current script file '$0' exists" >> location.txt

# Part 4: Append a list of running processes to a log file.
ps -f >> location.txt