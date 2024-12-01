#!/opt/homebrew/Cellar/bash/5.2.37/bin/bash

# Declare an hash with key value pairs for a meal plan
declare -A meal_plan=([Monday]="Pasta" [Tuesday]="Tacos" [Wednesday]="Pizza" [Thursday]="Burgers" [Friday]="Sushi")

## Loop through the hash and print each key value pair
for day in "${!meal_plan[@]}"; do
    echo "On $day we will eat ${meal_plan[$day]}"
done
