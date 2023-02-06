#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Пожалуйста, запустите от root."
  exit
fi
echo "Установка зависимостей.:"
apt-get install -y net-tools
echo "Установка macrandom."
cp macrandom_ru.sh /bin/macrandom
chmod +x /bin/macrandom
echo "Готово."
