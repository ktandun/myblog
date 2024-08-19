#!/usr/bin/env bash

for file in posts/*.md; do
	# Extract the filename without the extension
	filename="${file##*/}"

	base_name="${filename%.md}"

	# Define the new filename with the .html extension
	new_file="${base_name}.html"

	pandoc "$file" -o output/"$new_file" --template=template.html
done

pandoc index.md -o index.html --template=template.html
