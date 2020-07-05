#!/bin/bash
BLUE="\e[34m"
NC='\033[0m'

# Don't allow running as root
if [ `id -u` = 0 ] ; then
    echo "Error: don't run the script as sudo!"
    exit 1
fi

echo -e "${BLUE}
     ██╗███████╗██╗     ██████╗ ██████╗ ███████╗██╗  ██╗
     ██║██╔════╝██║     ██╔══██╗██╔══██╗██╔════╝██║ ██╔╝
     ██║█████╗  ██║     ██████╔╝██████╔╝█████╗  █████╔╝ 
██   ██║██╔══╝  ██║     ██╔══██╗██╔══██╗██╔══╝  ██╔═██╗ 
╚█████╔╝███████╗███████╗██████╔╝██║  ██║███████╗██║  ██╗
 ╚════╝ ╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝                                      
       ██╗     ██╗███╗   ██╗██╗   ██╗██╗  ██╗                  
       ██║     ██║████╗  ██║██║   ██║╚██╗██╔╝                  
       ██║     ██║██╔██╗ ██║██║   ██║ ╚███╔╝                   
       ██║     ██║██║╚██╗██║██║   ██║ ██╔██╗                   
       ███████╗██║██║ ╚████║╚██████╔╝██╔╝ ██╗                  
       ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝                  
                                                        
"
# ------------------ CHECK DEPENDENCIES ----------------------
echo -e "${BLUE}Checking depencies..."
if [ "$(which jq)" = "" ] ;then
    echo -e "${RED}\xE2\x9D\x8C ${NC}Dependency jq not installed! Please install it."
    exit 1
else 
    echo -e "${BLUE}\xE2\x9C\x94 ${NC}jq is installed!"
fi
if [ "$(which curl)" = "" ] ;then
    echo -e "${RED}\xE2\x9D\x8C ${NC}Dependency curl not installed! Please install it."
    exit 1
else 
    echo -e "${BLUE}\xE2\x9C\x94 ${NC}curl is installed!"
fi
if [ "$(which xsel)" = "" ] ;then
    echo -e "${RED}\xE2\x9D\x8C ${NC}Dependency xsel not installed! Please install it."
    exit 1
else 
    echo -e "${BLUE}\xE2\x9C\x94 ${NC}xsel is installed!"
fi
if [ "$(which git)" = "" ] ;then
    echo -e "${RED}\xE2\x9D\x8C ${NC}Dependency git not installed! Please install it."
    exit 1
else 
    echo -e "${BLUE}\xE2\x9C\x94 ${NC}git is installed!"
fi
# ------------------ END CHECKING DEPENDENCIES ------------------------

echo ""
echo "Okay, looks like you have all the dependencies."
echo "Let's get started!"
echo ""

# clone repository
echo -ne "Cloning repo..."
git clone https://github.com/SlimShadyIAm/jelbrek-linux -q
echo -e "${BLUE} \xE2\x9C\x94${NC}"

cd jelbrek-linux

# create shortcut so it can show up in spectacle
echo -ne "Creating desktop shortcut..."
sudo mv jelbrek.desktop /usr/share/applications/jelbrek.desktop
echo -e "${BLUE} \xE2\x9C\x94${NC}"

# add script to /usr/bin
echo -ne "Moving script to /usr/bin., setting permissions..."
sudo mv jelbrek.sh /usr/bin/jelbrek
sudo chmod +x /usr/bin/jelbrek
echo -e "${BLUE} \xE2\x9C\x94${NC}"

echo -ne "Cleaning up files..."
cd ..
rm -rf jelbrek-linux
echo -e "${BLUE} \xE2\x9C\x94${NC}"

echo ""
echo -e "Done! Goodbye!"