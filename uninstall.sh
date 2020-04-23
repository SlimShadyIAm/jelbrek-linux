#!/bin/bash
RED='\e[31m'
NC='\033[0m'

echo -e "${RED}Uninstalling Jelbrek-Linux ${NC}"

echo -ne "Removing desktop shortcut..."
sudo rm /usr/share/applications/jelbrek.desktop
echo -e "${RED} \xE2\x9C\x94${NC}"
echo -ne "Removing script..."
sudo rm /usr/bin/jelbrek
echo -e "${RED} \xE2\x9C\x94${NC}"

echo ""
echo -e "Done! Goodbye!"