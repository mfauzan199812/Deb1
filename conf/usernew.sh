#!/bin/bash
#Script auto create user SSH
clear
if [[ $USER != 'root' ]]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi
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
echo "------------------------ MEMBUAT AKUN SSH ------------------------"


	echo "           DEVELOPED BY ADITYA WG (082210988552)           "
echo ""

read -p "Isikan username: " username

egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
	echo "Username [$username] sudah ada!"
	exit 1
else
	read -p "Isikan password akun [$username]: " password
	read -p "Berapa hari akun [$username] aktif: " AKTIF

	today="$(date +"%Y-%m-%d")"
	expire=$(date -d "$AKTIF days" +"%Y-%m-%d")
	useradd -M -N -s /bin/false -e $expire $username
	echo $username:$password | chpasswd
echo -e ""
echo -e ""
echo -e "-------------------------------------"
echo -e "Data Login :"
echo -e "-------------------------------------"
echo -e "Host: $MYIP" 
echo -e "Dropbear Port: 22507,110,109,80"
echo -e "OpenSSH Port: 22,143"
echo -e "SSL/TLS Port: 443"
echo -e "Squid Proxy: 3128,8000,8080"
echo -e "Ovpn Config: http://$MYIP:81/client.ovpn"
echo -e "Username: $username "
echo -e "Password: $password"
echo -e "Aktif Sampai: $(date -d "$AKTIF days" +"%d-%m-%Y")"
echo -e "-------------------------------------"
echo -e ""
fi
