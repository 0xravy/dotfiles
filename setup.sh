#!/bin/bash

create_folders() {
    local base_dir="$1"
    local folders=("${@:2}")

    # Iterate through the array
    for folder in "${folders[@]}"; do
        # Construct the full path for the folder
        full_path="$base_dir/$folder"

        # Check if the folder already exists
        if [ -d "$full_path" ]; then
            echo "Folder '$folder' already exists in '$base_dir'. Skipping."
        else
            # If the folder doesn't exist, create it
            mkdir -p "$full_path"
            echo "Folder '$folder' created in '$base_dir'."
        fi
    done
}


create_folders "$HOME" "Coding" "Desktop" "Documents" "Downloads" "Music" "Notes" "Pictures" "Videos"

create_folders "$HOME/Coding" "projects" "tests"
create_folders "$HOME/Pictures" "images" "screenshots" "downloads"
create_folders "$HOME/Videos" "record" "edit" "downloads"


# get wallpapers
if [ -d "$HOME/Pictures/wallpapers" ]; then
  echo "wallpapers already exists."
else
  git clone https://github.com/0xravy/wallpapers.git $HOME/Pictures/wallpapers
  echo "wallpapers repo is clone."
fi


