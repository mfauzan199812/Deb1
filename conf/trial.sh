#!/bin/bash
#Script By Mohammad Fauzan R (fauzan121998@gmail.com) (0895703796928)
clear
# cek ip
vps="adityawg";
MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
if [ "$MYIP" = "" ]; then
	MYIP=$(wget -qO- ipv4.icanhazip.com)
fi
wget -q -O mfauzan https://raw.githubusercontent.com/mfauzan199812/Deb1/master/ip.txt
if ! grep -w -q $MYIP mfauzan; then
	echo "Maaf, hanya IP yang terdaftar yang bisa menggunakan script ini!"
	if [[ $vps = "mfauzan" ]]; then
		echo "Hubungi: Mohammad Fauzan R atau (0895703796928)"
	else
		echo "Hubungi: Mohammad Fauzan R atau (0895703796928)"
	fi
	rm /root/mfauzan
	rm -f /root/mfauzan
	exit
fi

username=trial-`</dev/urandom tr -dc X-Z0-9 | head -c4`	
AKTIF=1
password=`</dev/urandom tr -dc X-Z0-9 | head -c4`
	today="$(date +"%Y-%m-%d")"
	expire=$(date -d "$AKTIF days" +"%Y-%m-%d")
	useradd -M -N -s /bin/false -e $expire $username
	echo $username:$password | chpasswd
echo -e ""
echo -e "======================================="
echo -e "----------[Data Trial Akun]----------"
echo -e "Host: $MYIP" 
echo -e "Username: $username "
echo -e "Password: $password"
echo -e "    Port: 22507, 109, 110, 80, 22, 143"
echo -e "    SSL/TLS: 443"
echo -e "    Squid: 8000, 8080, 3128"
echo -e "    Ovpn Config: http://$MYIP:81/client.ovpn"
echo "Masa Aktif sampai : $(date -d "$AKTIF days" +"%d-%b-%Y")"
echo -e "-----------------------------------------"
echo -e "======================================"
echo -e "Baca & Patuhi TOS/Terms Of Service :"
echo -e "    1. No DDOS, No HACKING"
echo -e "    2. No CARDING, No SPAMING"
echo -e "    3. No MULTI LOGIN"
echo -e "    4. No TORENT"
echo -e "    5. No VISIT SITE PORN"
echo -e "    6. No GAME PLAYSTATION"
echo -e ""
echo -e "___Powered BY BogelSSH___"
echo -e "======================================"
echo -e ""
