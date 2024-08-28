#!/bin/bash

# Define the directory to search for .png files
directory="./src/textures/objects"

# Define the initial JSON structure
json='{
  "tags": {
    "oldschool-neovatar": [],
    "Colorable": []
  },
  "sets": {
    "oldschool-neovatar": [
      "oldschool-neovatar"
    ]
  }
}'

# Use find to get all .png files in the directory
while IFS= read -r -d '' file; do
  file=$(echo "$file" | sed 's|./src/||')
  # Use jq to add the file to the JSON structure
  json=$(echo $json | jq --arg file "$file" '.tags["oldschool-neovatar"] += [$file] | .tags["Colorable"] += [$file]')
done < <(find $directory -type f -name "*.png" -print0 | sort -z)

# Print the final JSON
echo $json | jq .