#!/usr/bin/env zsh

# very simple script that creates (if it doesn't exist) a working test environment
# and cleans (if it does exist) an existing test environment
# 
# this is only useful if you want to hack on the vsp script

# Default directory path (current working directory)
directory="./"

total_dirs=10

if [ "$1" = "-d" ] && [ -n "$2" ]; then
    directory="$2"
fi

mkdir -p $directory/Default
mkdir -p $directory/Profile\ {1..$total_dirs}
find $directory -name Preferences -exec rm {} \;
touch $directory/Default/Preferences
touch $directory/Profile\ {1..$total_dirs}/Preferences
echo "cleaned"

