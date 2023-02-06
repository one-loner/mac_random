#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root."
  exit
fi
echo "Installing requirements:"
apt-get install -y net-tools
echo "Installing macrandom."
cp macrandom.sh /bin/macrandom
chmod +x /bin/macrandom
echo "Done."
