#!/bin/bash

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Function to check and install Git if not installed
install_git() {
    if ! command -v git &> /dev/null; then
        echo -e "${YELLOW}Git is not installed. Installing...${NC}"
        brew install git
        if [ $? -ne 0 ]; then
            echo -e "${RED}Git installation failed. Exiting...${NC}"
            exit 1
        else
            echo -e "${GREEN}Git installed successfully.${NC}"
        fi
    else
        echo -e "${GREEN}Git is already installed.${NC}"
    fi
}

# Function to set git user configuration and additional settings
configure_git() {
    # Check if .gitconfig file exists
    if [ -f "$HOME/.gitconfig" ]; then
        git_user_name=$(git config --global user.name)
        git_email=$(git config --global user.email)
        
        if [ -n "$git_user_name" ] && [ -n "$git_email" ]; then
            echo -e "${YELLOW}.gitconfig already exists with user.name and user.email set. Aborting configuration.${NC}"
        else
            read -p "Enter your Git user name (leave blank to skip): " git_user_name
            read -p "Enter your Git email (leave blank to skip): " git_email

            if [ -n "$git_user_name" ]; then
                git config --global user.name "$git_user_name"
            fi

            if [ -n "$git_email" ]; then
                git config --global user.email "$git_email"
            fi

            echo -e "${GREEN}Git configuration updated.${NC}"
        fi
    else
        read -p "Enter your Git user name (leave blank to skip): " git_user_name
        read -p "Enter your Git email (leave blank to skip): " git_email

        if [ -n "$git_user_name" ]; then
            git config --global user.name "$git_user_name"
        fi

        if [ -n "$git_email" ]; then
            git config --global user.email "$git_email"
        fi

        echo -e "${GREEN}Git configuration updated.${NC}"
    fi

    # Check if init.defaultBranch is already configured
    git_default_branch=$(git config --global init.defaultBranch)
    if [ -n "$git_default_branch" ]; then
        echo -e "${YELLOW}init.defaultBranch is already set to: $git_default_branch. Aborting configuration.${NC}"
    else
        git config --global init.defaultBranch "main"
        echo -e "${GREEN}Git default branch set to: main.${NC}"
    fi

    # Check if core.pager is already configured
    git_core_pager=$(git config --global core.pager)
    if [ -n "$git_core_pager" ]; then
        echo -e "${YELLOW}core.pager is already set to: $git_core_pager. Aborting configuration.${NC}"
    else
        git config --global core.pager "less --LONG-PROMPT --tabs=3 --quit-if-one-screen --tilde --jump-target=3 --ignore-case --status-column"
        echo -e "${GREEN}Git core pager set to: less.${NC}"
    fi
}


install_git || exit 1
configure_git