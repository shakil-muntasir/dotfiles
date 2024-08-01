#!/bin/bash

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Function to check and install zsh if not installed
install_zsh() {
    if ! command -v zsh &> /dev/null; then
        echo -e "${YELLOW}Zsh is not installed. Installing...${NC}"
        sudo apt-get install -y zsh
        if [ $? -ne 0 ]; then
            echo -e "${RED}Zsh installation failed. Exiting...${NC}"
            exit 1
        fi
        if [ -f "$HOME/.zshrc" ]; then
            echo -e "${YELLOW}Backing up existing .zshrc...${NC}"
            mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
        fi
        touch "$HOME/.zshrc"
    else
        echo -e "${GREEN}Zsh is already installed.${NC}"
    fi

    # Change the default shell to zsh
    if [ "$SHELL" != "$(which zsh)" ]; then
        echo -e "${YELLOW}Changing the default shell to zsh...${NC}"
        chsh -s $(which zsh)
    else
        echo -e "${GREEN}The default shell is already zsh.${NC}"
    fi
}

# Run zsh installation
install_zsh

# Run git.sh script
./scripts/git.sh

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
