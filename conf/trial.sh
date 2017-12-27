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

username=trial-`</dev/urandom tr -dc X-Z0-9 | head -c4`	
AKTIF=1
password=`</dev/urandom tr -dc X-Z0-9 | head -c4`
	today="$(date +"%Y-%m-%d")"
	expire=$(date -d "$AKTIF days" +"%Y-%m-%d")
	useradd -M -N -s /bin/false -e $expire $username
	echo $username:$password | chpasswd
echo -e "-------------[Trial Akun]-------------"
echo -e "Host: $MYIP" 
echo -e "Username: $username "
echo -e "Password: $password"
echo -e "Port: 22507,1922,443,80,22,143"
echo -e "Squid: 8000,8080,3128"
echo -e "Ovpn : http://$MYIP:81/client.ovpn"
echo -e "--------------------------------------"
