#!/bin/bash

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Function to install Oh My Zsh
install_oh_my_zsh() {
    if [ -d "$HOME/.oh-my-zsh" ]; then
        echo -e "${YELLOW}Oh My Zsh is already installed.${NC}"
    else
        echo -e "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc > /dev/null 2>&1
        if [ $? -ne 0 ]; then
            echo -e "${RED}Oh My Zsh installation failed.${NC}"
            exit 1
        fi
    fi
}

# Function to install zsh-autosuggestions
install_zsh_autosuggestions() {
    if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
        echo -e "${YELLOW}zsh-autosuggestions is already installed.${NC}"
    else
        echo -e "Installing zsh-autosuggestions..."
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions > /dev/null 2>&1
    fi
}

# Function to install zsh-syntax-highlighting
install_zsh_syntax_highlighting() {
    if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
        echo -e "${YELLOW}zsh-syntax-highlighting is already installed.${NC}"
    else
        echo -e "Installing zsh-syntax-highlighting..."
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting > /dev/null 2>&1
    fi
}

# Function to install zsh-nvm
install_zsh_nvm() {
    if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-nvm" ]; then
        echo -e "${YELLOW}zsh-nvm is already installed.${NC}"
    else
        echo -e "Installing zsh-nvm..."
        git clone https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-nvm > /dev/null 2>&1
    fi
}

# Function to install powerlevel10k
install_powerlevel10k() {
    if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
        echo -e "${YELLOW}powerlevel10k is already installed.${NC}"
    else
        echo -e "Installing powerlevel10k..."
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k > /dev/null 2>&1
    fi
}

# Main execution
echo -e "${YELLOW}Starting installation...${NC}"
install_oh_my_zsh || exit 1
install_zsh_autosuggestions
install_zsh_syntax_highlighting
install_zsh_nvm
install_powerlevel10k
echo -e "${GREEN}Oh My Zsh installation successful.${NC}"
