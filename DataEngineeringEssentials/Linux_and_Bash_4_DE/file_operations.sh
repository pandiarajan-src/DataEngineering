#!/bin/zsh

# If file.txt exists, delete it
if [ -f file.txt ]; then
    rm file.txt
fi

# Create a file
touch file.txt

# Add content to a file
echo "Hello World" >> file.txt
for i in {1..100}; do
    prev=$(($i-1))
    next=$(($i+1))
    echo "This is line $i, Previous line was $prev, Next line will be $next" >> file.txt
    if [ $i -eq 10 ]; then
        echo "At line 10 introducing an error" >> file.txt
    fi
done

# Truncate - Reduce the size of a file using commands like head and tail
# Truncate - Get first 5 lines 
echo "===========head of file.txt==========="
head -n 5 file.txt

# Truncate - Get last line
echo "===========tail of file.txt==========="
tail -n 1 file.txt  

# Truncate - Shuffling some lines and result it
echo "===========shuf of file.txt==========="
# shuf -n 5 file.txt # Linux only command

# Filter - Get lines with "error" 
echo "===========error line in file.txt==========="
grep "error" file.txt

# Find - Find files named "data.csv"
find . -name "file.txt"

# Locate - Find files containing "stats"
# locate "*file*"

# Cut - Get 2nd column from file
cut -d "," -f 2 file.txt > temp.res  && head -n 5 temp.res
if [ -f temp.res ]; then
    rm temp.res
fi
