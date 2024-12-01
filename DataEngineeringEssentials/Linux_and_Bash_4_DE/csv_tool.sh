#!/opt/homebrew/Cellar/bash/5.2.37/bin/bash

process_csv() {
    # CSV processing logic
    echo "Parsing CSV file: $1"

    # Print number of records
    echo "Number of records: $(cat $1 | wc -l)"
}

if [ $# -le 0 ]; then
    echo "Usage: csv_tool.sh <filename>"
    exit 1
else
    FILES=()
    for arg in "$@"; do
        if [ -f "$arg" ]; then
            FILES+=("$arg")
        fi
    done

    for file in "${FILES[@]}"; do
        process_csv "$file"
    done
fi

# Run the script with a csv file
# ./csv_tool.sh data.csv
# ./csv_tool.sh data.csv data2.csv
# ./csv_tool.sh data.csv data2.csv data3.csv
