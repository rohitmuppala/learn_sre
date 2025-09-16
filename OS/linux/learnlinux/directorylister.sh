#!/usr/bin/bash
dir=$1
echo "Listing contents of directory: $dir"
for item in $(ls "$dir"); do
	echo "$item"
done
