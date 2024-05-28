#!/bin/bash

# Check if the input file is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

input_file="$1"

# Check if the input file exists
if [ ! -e "$input_file" ]; then
    echo "Error: File '$input_file' not found."
    exit 1
fi

# Create a temporary file for the sorted and unique lines
temp_file=$(mktemp)

# Sort the input file and remove duplicate lines
sort -u "$input_file" > "$temp_file"

# Overwrite the original file with the sorted and unique lines
mv "$temp_file" "$input_file"

echo "Duplicate lines removed from $input_file."
