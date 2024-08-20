#!/bin/zsh

# Grep operations

if [ -f file.txt ]; then
    rm file.txt
fi

touch file.txt

for i in {1..100}; do
    prev=$(($i-1))
    next=$(($i+1))
    echo "This is line $i, Previous line was $prev, Next line will be $next" >> file.txt
    if [ $i -eq 10 ]; then
        echo "At line 10 introducing an error" >> file.txt
    elif [ $i -eq 20 ]; then
        echo "Apple, Banana, Orange" >> file.txt
    elif [ $i -eq 30 ]; then
        echo "Madurai, Chennai, Trichy" >> file.txt
    fi
done

# Find pattern
grep Apple file.txt

# Find pattern of case-insensitive
echo "==============Find pattern of case-insensitive=============="
grep -i apple file.txt

# Count occurrences
echo "==============Count occurrences=============="
grep -c Previous file.txt

# Find either pattern
grep -e Apple -e Madurai file.txt

# Count on Find either pattern
grep -c -e Apple -e Previous file.txt

# Show all lines that DO NOT contain pattern
echo "==============Show all lines that DO NOT contain pattern=============="
grep -v This file.txt

