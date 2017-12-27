#!/bin/bash
clear
if [[ $USER != 'root' ]]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi
# cek ip
vps="adityawg";
MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
wget -q -O adit http://skrip.kerdunet.info/notfound.txt
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

echo "------------------------ UNBANNED USER -----------------------------"
echo "               DEVELOPED BY ADITYA (082210988552)                   "
echo ""
echo "--------------------------------------------------------------------"
cat /root/banneduser.txt
echo "--------------------------------------------------------------------"
echo ""

read -p "Isikan username: " username

egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
	echo ""
	read -p "Apakah Anda benar-benar ingin mem-unbanned akun [$username] [y/n]: " -e -i y UNBANNED
	if [[ "$UNBANNED" = 'y' ]]; then
		sed -i "s/ User : $username//g" /root/banneduser.txt
		sed -i /^$/d /root/banneduser.txt
		passwd -u $username
		echo ""
		echo "Akun [$username] berhasil diunbanned!"
	else
		echo ""
		echo "Unbanned akun [$username] dibatalkan!"
	fi
else
	echo "Username [$username] belum terdaftar!"
	exit 1
fi
