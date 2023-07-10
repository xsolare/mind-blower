#!/bin/bash

# Define colors
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
RED='\033[0;31m'
NC='\033[0m'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Check if NVM is installed
if ! command -v nvm &> /dev/null; then
    echo "\n${PURPLE}NVM is not installed. Installing NVM...${NC}\n"

    # Download and install NVM
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

    # Activate NVM
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

    # Verify installation
    if command -v nvm &> /dev/null; then
        echo "\n${GREEN}NVM installed successfully.${NC} $(nvm -v) \n"
    else
        echo "\n${RED}Failed to install NVM.${NC}\n"
        exit 1
    fi

else
    echo -e "${PURPLE}NVM is already installed.${NC} $(nvm -v) \n"
fi

nvm install
echo -e "\n"
