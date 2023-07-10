#!/bin/bash

# Define colors
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
RED='\033[0;31m'
NC='\033[0m'
    
# Check if pnpm is installed
if ! command -v pnpm &> /dev/null; then
    echo "\n${PURPLE}pnpm is not installed. Installing pnpm...${NC}\n"
    
    # Install pnpm using npm
    curl -sSL https://get.pnpm.io/install.sh | sh
    
    # Verify installation
    if command -v pnpm &> /dev/null; then
        echo "\n${GREEN}pnpm installed successfully.${NC} $(pnpm -v) \n"
    else
        echo "\n${RED}Failed to install pnpm.${NC}\n"
        exit 1
    fi
else
    echo -e "${PURPLE}pnpm is already installed.${NC} $(pnpm -v) \n"
fi

