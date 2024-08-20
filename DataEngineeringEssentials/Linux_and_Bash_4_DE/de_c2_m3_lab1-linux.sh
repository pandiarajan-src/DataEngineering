#!/bin/bash

CSV_FILE=./DataEngineeringEssentials/Linux_and_Bash_4_DE/nba_2017.csv

# Challenge 1: Use head, tail and redirection to print the first and last 5 lines of a text file
# echo "============Head of $CSV_FILE of 5 lines============"
# head -n 5 $CSV_FILE
# echo "============Tail of $CSV_FILE of 5 lines============"
# tail -n 5 $CSV_FILE

# Challenge 2: Employ grep with flags like -c and -v to count and exclude lines in a file
grep -v PF $CSV_FILE | grep -c Eric $CSV_FILE 

# Challenge 3: Utilize find to locate files modified within the last day
find . -type f -mtime -1

# Challenge 4: Chain together grep, wc, and sort using pipes to analyze a log file
grep -e Jeremy -e Mike -e Eric $CSV_FILE | wc -l
grep -e Jeremy -e Mike -e Eric $CSV_FILE | sort

# Challenge 5: Leverage shuf to extract a random sampling of lines from a large CSV
shuf -n 100 nba_2017.csv