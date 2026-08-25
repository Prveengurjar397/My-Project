Task 4: Install Packages via Script

Created install_packages.sh to check whether packages are installed and install missing packages.

Packages practiced:

nginx
curl
wget

Script :

#!/bin/bash

if [ "$EUID" -eq 0 ]; then
    for i in nginx curl wget; do
        if dpkg -s "$i" &> /dev/null; then
            echo "$i package is already installed"
        else
            apt-get install "$i" -y
            echo "$i package installed successfully"
        fi
    done
else
    echo "Run as root"
    exit 1
fi

Example Output :
nginx   package installed successfully
curl    package is already installed
wget    package is already installed

Important Commands
dpkg -s "$i"
Checks whether a Debian/Ubuntu package is installed.

apt-get install "$i" -y
Installs the package without asking for confirmation.

Root Check
if [ "$EUID" -eq 0 ]; then
EUID = 0 means the script is running as root.

