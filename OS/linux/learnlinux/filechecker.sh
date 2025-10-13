#!/usr/bin/bash

if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    echo "File Checker"
    echo "Usage: $0 <file1> [file2 ... fileN]"
    echo "Checks if each specified file exists and prints a message for each."
    echo "Example: $0 notes.txt report.pdf"
    exit 0
fi

if [ "$#" -eq 0 ]; then
    echo "Error: No filenames provided."
    echo "Use --help for usage."
    exit 1
fi

for file in "$@"; do
    if [ -f "$file" ]; then
        echo "File '$file' exists."
    else
        echo "File '$file' does not exist."
    fi
done
