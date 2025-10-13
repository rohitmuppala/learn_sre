#!/usr/bin/bash

if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    echo "Directory Lister"
    echo "Usage: $0 <dir1> [dir2 ... dirN]"
    echo "Lists all files and directories inside each specified directory."
    echo "Example: $0 /home/user /tmp"
    exit 0
fi

if [ "$#" -eq 0 ]; then
    echo "Error: No directory paths provided."
    echo "Use --help for usage."
    exit 1
fi

for dir in "$@"; do
    if [ -d "$dir" ]; then
        echo "Listing contents of directory: $dir"
        for item in $(ls "$dir"); do
            echo "  $item"
        done
    else
        echo "Error: '$dir' is not a directory."
    fi
done
