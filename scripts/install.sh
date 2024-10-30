#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}Starting Modern Terminal UI installation...${NC}"

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
  echo -e "${RED}Please run as root (use sudo)${NC}"
  exit 1
fi

# Update system
echo -e "${YELLOW}Updating system packages...${NC}"
apt update && apt upgrade -y

# Install Node.js and npm
echo -e "${YELLOW}Installing Node.js and npm...${NC}"
apt install -y curl
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt install -y nodejs

# Install build essentials
echo -e "${YELLOW}Installing build essentials...${NC}"
apt install -y build-essential git

# Install required fonts
echo -e "${YELLOW}Installing terminal fonts...${NC}"
apt install -y fonts-jetbrains-mono fonts-ubuntu-mono fonts-dejavu fonts-hack

# Verify installations
echo -e "${YELLOW}Verifying installations...${NC}"
node_version=$(node --version)
npm_version=$(npm --version)

echo -e "${GREEN}Installation complete!${NC}"
echo -e "Node.js version: ${node_version}"
echo -e "npm version: ${npm_version}"

# Create terminal config directory
mkdir -p /etc/modern-terminal-ui
chmod 755 /etc/modern-terminal-ui

echo -e "${GREEN}Setup complete! You can now run the application using the run.sh script.${NC}"