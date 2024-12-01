#!/usr/bin/env bash
#
# This is a Bash script that prints a specified phrase a certain number of times, 
# with an option to reverse the phrase.
#

# Counts - Number of times to print phrase
count=5

# Phrase - Message to print 
phrase="hello world"

# Reverse - Whether to reverse string
reverse=0

# Capitalize - Whether to capitalize string
capitalize=0

# Delimiter - Delimiter to use
delimiter=","

# Concatenate phrase with delimiter
concatenate=0

# Parse options
# This block processes command-line arguments:
# -c or --count: Sets the count variable to the provided value.
# -p or --phrase: Sets the phrase variable to the provided value.
# -r or --reverse: Sets the reverse flag to 1 (indicating the phrase should be reversed).
# -z or --capitalize: Sets the capitalize flag to 1 (indicating the phrase should be capitalized).
# -d or --delimiter: Sets the delimiter variable to the provided value.
# -a or --concatenate: Sets the concatenate flag to 1 (indicating the phrase should be concatenated with the delimiter).

while [[ $# -gt 0 ]]; do
   key="$1"
   case $key in
     -c|--count)
        count="$2"
        shift
        ;;
     -p|--phrase)
        phrase="$2"
        shift
        ;;
     -r|--reverse)
        reverse=1
        ;;
     -z|--capitalize)
        capitalize=1
        ;;
     -d|--delimiter)
        delimiter="$2"
        shift
        ;;
     -a|--concatenate)
        concatenate=1
        ;;
    esac
    shift
done

# # For debugging purposes, print out the values of the variables after parsing the options.
# echo "Count: $count"
# echo "Phrase: $phrase"
# echo "Reverse: $reverse"
# echo "Capitalize: $capitalize"
# echo "Delimiter: $delimiter"
# echo "Concatenate: $concatenate"


# Generate phrase 
# A for loop runs from 0 to count-1, printing the phrase each time.
# If the reverse flag is set (reverse -eq 1), the phrase is reversed using the rev command before printing.
# Otherwise, the original phrase is printed.
# Capitalize phrase if capitalize flag set
if [ $capitalize -eq 1 ]; then
  phrase=$(echo $phrase | awk '{print toupper($0)}')
fi

# Concatenate the phrase with the delimiter if the concatenate flag is set
if [ $concatenate -eq 1 ]; then
  concatenated_phrase=""
  for ((i=0; i<$count; i++)); do
    if [ $i -eq 0 ]; then
      concatenated_phrase="$phrase"
    else
      concatenated_phrase="$concatenated_phrase$delimiter$phrase"
    fi
  done
  phrase="$concatenated_phrase"
  # After concatenation, we only need to print the concatenated phrase once
  count=1
fi

# Print phrase
for ((i=0; i<$count; i++)); do
  if [ $reverse -eq 1 ]; then
    echo "$phrase" | rev
  else
    echo "$phrase"
  fi
done


# Test code

# # Test 1: Default behavior
# echo "Test 1: Default behavior"
# ./phrase.sh

# # Test 2: Custom count
# echo "Test 2: Custom count"
# ./phrase.sh -c 3

# # Test 3: Custom phrase
# echo "Test 3: Custom phrase"
# ./phrase.sh -p "data engineering"

# # Test 4: Reverse phrase
# echo "Test 4: Reverse phrase"
# ./phrase.sh -r

# # Test 5: Capitalize phrase
# echo "Test 5: Capitalize phrase"
# ./phrase.sh -z

# # Test 6: Custom delimiter
# echo "Test 6: Custom delimiter"
# ./phrase.sh -d ";"

# # Test 7: Concatenate phrase with delimiter
# echo "Test 7: Concatenate phrase with delimiter"
# ./phrase.sh -a

# # Test 8: Combination of options
# echo "Test 8: Combination of options"
# ./phrase.sh -c 2 -p "data engineering" -r -z -d ";" -a