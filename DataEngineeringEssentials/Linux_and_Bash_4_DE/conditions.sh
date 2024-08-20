#!/bin/zsh

# For loop conditions examples
for i in {1..10}; do
    echo "Welcome $i times"
done

# For loop Array conditions in For loop
declare -a Fruits=("Apple" "Banana" "Orange")
for i in "${Fruits[@]}"; do
    echo "$i"
done

# While loop conditions examples
echo "How many loops you want tor run?:"
read LOOPS
i=0
while [ $i -lt $LOOPS ]
do
    echo "Welcome $i times"
    i=$((i + 1))
done

# If Else conditions examples
MY_VAR=15
if [ $MY_VAR -eq 10 ]; then
    echo "$MY_VAR is equal to 10"
elif [ $MY_VAR -gt 10 ]; then
    echo "$MY_VAR is greater than 10"
else
    echo "$MY_VAR is less than 10"
fi

# If Else condition with AND OR examples
# And logical example 
x=5
if [ $x -gt 2 ] && [ $x -lt 10 ]; then
   echo "x meets both conditions $x > 2 and $x < 10"
fi

false && echo "This will not be printed"
true && echo "This will be printed"