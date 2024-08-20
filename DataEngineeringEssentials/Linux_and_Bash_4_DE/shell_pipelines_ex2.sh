#!/bin/bash

# Part 1: Count the files and directories in /usr/bin
# Pipe the output of ls -l /usr/bin | wc -l to count the files and directories in/usr/bin
# How many did you count?
ls -l /usr/bin | wc -l


# Part 2: Create a new file with echo a
# Run the following command "echo 'hi'"
# Pipe this to a file by using "echo 'hi' > hello.txt"
# Now run ls to verify it exists
# count the words in the file cat hello.txt | wc -w
# How many did you count?

echo "hi hello how are you?" > output.txt
[ -f output.txt ] && cat output.txt | wc -w
