#!/bin/bash

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Directory where dotfiles are stored
dotfiles_dir="${HOME}/.dotfiles"

# Function to create symlinks
create_symlink() {
    local source_file="$1"
    local target_file="$2"
    
    # If the target file exists and is a symlink, skip creating a new symlink
    if [ -L "$target_file" ]; then
        echo -e "${YELLOW}Skipping: $target_file already symlinked.${NC}"
        return
    fi
    
    # If the target file already exists and is not a symlink, rename it with timestamp
    if [ -e "$target_file" ]; then
        timestamp=$(date +"%Y-%m-%d_%H:%M:%S")
        mv "$target_file" "${target_file}_${timestamp}.backup"
        echo -e "${YELLOW}Existing file renamed: ${target_file} -> ${target_file}.${timestamp}.backup${NC}"
    fi
    
    # Create symlink only if source file is not a .backup file
    if [[ ! "$source_file" =~ \.backup$ ]]; then
        ln -s "$source_file" "$target_file"
        echo -e "Created symlink: $source_file -> $target_file"
    fi
}

# Function to create symlinks for dotfiles
find_dotfiles() {
    local directory="$1"
    local target_directory="$HOME"
    
    # Find dotfiles recursively
    while IFS= read -r -d '' file; do
        # Exclude .git directory and .gitignore files
        if [[ "$file" != *".git"/* && "$file" != *".gitignore" ]]; then
            filename=$(basename "$file")
            target_file="${target_directory}/${filename}"
            create_symlink "$file" "$target_file"
        fi
    done < <(find "$directory" -type f -name ".*" -not -path "*/.git/*" -not -name ".gitignore" -not -path "*/.DS_Store/*" -print0)
}

# Function to unlink symlinks
unlink_symlinks() {
    local directory="$1"
    
    # Find dotfiles recursively
    while IFS= read -r -d '' file; do
        # Exclude .git directory and .gitignore files
        if [[ "$file" != *".git"/* && "$file" != *".gitignore" ]]; then
            filename=$(basename "$file")
            target_file="$HOME/${filename}"
            
            # If the symlink exists, unlink it
            if [ -L "$target_file" ]; then
                rm "$target_file"
                echo -e "Removed symlink: $target_file"
            fi
        fi
    done < <(find "$directory" -type f -name ".*" -not -path "*/.git/*" -not -name ".gitignore" -not -path "*/.DS_Store/*" -print0)
}

# Main execution
echo -e "${YELLOW}Setting up dotfiles...${NC}"
if [ "$1" == "--unlink" ]; then
    unlink_symlinks "$dotfiles_dir"
    echo -e "${GREEN}Dotfiles unlinked.${NC}"
else
    find_dotfiles "$dotfiles_dir"
    echo -e "${GREEN}Symlinks setup successful.${NC}"
fi
