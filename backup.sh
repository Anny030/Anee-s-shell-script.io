#!/bin/bash

# Parse command line arguments
source_directory="$1"
destination_directory="$2"

# Check if source and destination directories are provided
if [ -z "$source_directory" ] || [ -z "$destination_directory" ]; then
  echo "Error: Source and destination directories are required." >&2
  exit 1
fi

# Create backup directory if it doesn't exist
mkdir -p "$destination_directory"

# Create backup filename with timestamp
backup_filename="$(date +'%Y%m%d%H%M%S').tar.gz"

# Create tar archive of source directory
tar -czf "$destination_directory/$backup_filename" -C "$source_directory" .

echo "Backup created: $destination_directory/$backup_filename"
