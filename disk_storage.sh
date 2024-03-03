#!/bin/bash

# Set default values
show_all=false
top_entries=8

# Parse command line arguments
while getopts ":d:n:" opt; do
  case $opt in
    d)
      show_all=true
      directory="$OPTARG"
      ;;
    n)
      top_entries="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

# Shift the parsed options out of the arguments
shift $((OPTIND -1))

# Get the directory argument
directory="${1}"

# Check if directory argument is provided
if [ -z "$directory" ]; then
  echo "Error: Directory argument is required." >&2
  exit 1
fi

# Check disk usage based on arguments
if [ "$show_all" = true ]; then
  du -ah "$directory" | sort -rh | head -n "$top_entries"
else
  du -h "$directory" | sort -rh | head -n "$top_entries"
fi
