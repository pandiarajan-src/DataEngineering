#!/opt/homebrew/Cellar/bash/5.2.37/bin/bash

# Part 2: Build a CLI string reverser tool

# Run the script ./reverse with a few words to reverse them: ./reverse.sh foo bar biz
# What happened?
# Modify the print statement slightly to use a ":" instead of a "-" in the output.

# # Print the reversed string, complex code
# i=1;    #initialize count
# j=$#;   #get script input size

# while [[ $# -gt 0 ]]
# do
#     rstring=$(echo $1 | rev);
#     echo "Reversing string $i - $1 - $rstring";
#     i=$((i + 1)); #increment the count
#     shift 1;      #process the next argument
# done

# Print the reversed string, simple code
for word in "$@"; do
    rstring=$(echo $word | rev);
    echo "Reversing string: $word : $rstring";
done


