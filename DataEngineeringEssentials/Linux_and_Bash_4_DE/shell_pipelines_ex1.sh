
# Basic pipe usage

# Pipe a directory listing into a line count.
ls -l /usr/bin | wc -l

# Redirect the output into a text file.
date > output.txt
echo "================================" >> output.txt

# Redirect output to file and append them
ls -l >> output.txt

# Conditional execution
# Only echo a message if a file exists using &&.
[ -f file.txt ] && echo "File exists" 
echo "================================" >> output.txt

# Append a list of running processes to a log file.
ps -f >> output.txt

# Edit command
# Use control characters to edit long commands.
# Ctrl+A - Start of line
# Ctrl+E - End of line