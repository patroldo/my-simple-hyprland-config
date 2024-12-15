#/usr/bin/bash

# Prompt user for input securely
echo "Enter the text to hash: "
read -s input_text # -s hides the input

# Echo the input text into sha256sum and display the hash
echo -n "$input_text" | sha256sum | awk '{ print toupper($1) }'
