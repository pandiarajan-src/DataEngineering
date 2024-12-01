#!/bin/bash

#
# This is where comments go
# It can be useful to explain the purpose of the script
## Note you can also start your script with #!/bin/bash -xv for verbose debugging
## https://tldp.org/

# Set strict mode. Causes shell to exit when a command fails
set -e

# Enables printing of shell input lines as they are read
set -v

# Enables print of command traces before executing command
set -x

variable="Hello World"
echo "This is a script with a variable: $variable" # Print variable
