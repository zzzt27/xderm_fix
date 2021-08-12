#!/bin/bash
if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

HOME="/root"
profil="${HOME}/profiles"
WWW="/www/xderm"
index="${www}/index.php"
xderm="${www}/xderm-mini"
echo -e "buat folder profile"
sleep 2
mkdir -p "${profil}"
echo -e "hapus file lama"
sleep 2
rm "${xderm}"
rm "${index}"
echo -e "downloading..."
sleep 2
wget -O "${www}/index.php" --no-check-certificate https://raw.githubusercontent.com/zzzt27/xderm_fix/main/index.php
wget -O "${www}/xderm-mini" --no-check-certificate https://raw.githubusercontent.com/zzzt27/xderm_fix/main/xderm-mini
chmod +x "${xderm}"
chmod +x "${index}"
clear
echo -e "done"
