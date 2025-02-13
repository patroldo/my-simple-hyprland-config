#!/bin/bash

# Function to display help
show_help() {
  echo "Usage: $(basename $0) [OPTIONS]"
  echo "Options:"
  echo "  -u <USER> To unblock user"
  echo "  -h        Show this help message and exit"
  echo "Example: $(basename $0) -u yurii"
}

unblock_user() {
  faillock --user $1 --reset
}

# Parse arguments
while getopts "hu" opt; do
  case "$opt" in
  h)
    show_help
    exit 0
    ;;
  u)
    shift $((OPTIND - 1))
    unblock_user $1
    exit 0
    ;;
  *)
    echo "Invalid option. Use -h for help."
    exit 1
    ;;
  esac
done

if [ -z "$1" ]; then
  show_help
  exit 1
fi
