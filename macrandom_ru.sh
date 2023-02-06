#!/bin/bash
if [ -z $1 ]; then
echo "Использование:"
echo ""
echo "macrandom интерфейс"
echo ""
echo "Пример:"
echo ""
echo "macrandom enp2s0"
echo ""
echo "Скрипт должен быть запущен от root. Все изменения сбросятся после перезагрузки."
exit
fi

if [ "$EUID" -ne 0 ]
  then echo "Пожалуйста, запустите от root."
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
echo "Предупреждение: mac адрес сбросится после перезагрузки компьютера."
