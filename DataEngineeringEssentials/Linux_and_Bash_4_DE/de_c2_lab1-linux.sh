# Goal: Truncate file with Bash
# For this project you will create a shell pipeline that truncates a file via random shuffling, 
# then verifies the correct number of lines. 
# Many times large files are so big that traditional data science libraries like pandas or jupyter cannot process them. 
# One approach to dealing with this problem is to sample the file by truncating and shuffling the results.


# Part 1: Count the lines in the file and inspect the contents of the file
wc -l nba_2017.csv
head nba_2017.csv

# Part 2: Truncate and shuffle the file
shuf -n 100 nba_2017.csv > small_nba_2017.csv
head small_nba_2017.csv

# Part 3: Remove Column Names Before Shuffle
tail -n +2 $CSV_FILE | head
