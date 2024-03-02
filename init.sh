#!/bin/bash

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Run omz.sh script
./scripts/omz.sh

# Check if omz.sh was successful
if [ $? -eq 0 ]; then
    # Run symlinks.sh script
    ./scripts/symlinks.sh
    
    # Check if symlinks.sh was successful
    if [ $? -eq 0 ]; then
        # Switch to zsh and source ~/.zshrc
        echo "Switching to zsh..."
        exec zsh
        source $HOME/.zshrc
    else
        echo -e "${RED}Symlinks setup failed. Exiting...${NC}"
        exit 1
    fi
else
    echo -e "${RED}Oh My Zsh installation failed. Exiting...${NC}"
    exit 1
fi
