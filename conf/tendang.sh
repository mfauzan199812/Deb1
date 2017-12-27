#!/bin/bash
clear
# cek ip
vps="adityawg";
MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
if [ "$MYIP" = "" ]; then
	MYIP=$(wget -qO- ipv4.icanhazip.com)
fi
wget -q -O adit https://raw.githubusercontent.com/DomeiNokiO/xsped/master/adt.txt
if ! grep -w -q $MYIP adit; then
	echo "Maaf, hanya IP yang terdaftar yang bisa menggunakan script ini!"
	if [[ $vps = "adityawg" ]]; then
		echo "Hubungi: AdityaWg atau (082210988552)"
	else
		echo "Hubungi: AdityaWg atau (082210988552)"
	fi
	rm /root/adit
	rm -f /root/adit
	exit
fi


echo -e "----------------- Menendang User Yg Multi Login --------------------"
read -p "Berapa Multi Login Yg Akan Ditendang (1-2):" limit
userlimit $limit
