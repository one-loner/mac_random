#!/bin/bash
if [ -z $1 ]; then
echo "Usage:"
echo ""
echo "macrandom interface"
echo ""
echo "Example:"
echo ""
echo "macrandom enp2s0"
echo ""
echo "Script must be run by root. All changes will be reset after reboot system."
exit
fi

if [ "$EUID" -ne 0 ]
  then echo "Please run as root."
  exit
fi
# Generate a random number between 0 and 255
function random_byte {
  echo $(( ( RANDOM & 255 ) ))
}
for num in {1..5}
do
mac=$(echo "$(printf '%02x:%02x:%02x:%02x:%02x:%02x\n' $(random_byte) $(random_byte) $(random_byte) $(random_byte) $(random_byte) $(random_byte))")
ifconfig $1 hw ether $mac
done
ifconfig $1
echo ""
echo ""
echo "Warning: changed mac address will be reset after reboot system."
