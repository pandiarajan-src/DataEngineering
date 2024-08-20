# Example capturing output of ls command to output.txt file
ls -l /home > output.txt

# Example reading user input into variable
read -p "Enter file name: " filename
echo "You entered: $filename"


# Example reading user input into variable
read -p "Enter file name: " filename
echo "You entered: $filename"


# Example redirecting errors from invalid command to errors.txt 
ls -l invalid 2> errors.txt

# Chaining grep, sort and uniq commands
ps -ef | grep python | sort | uniq -c