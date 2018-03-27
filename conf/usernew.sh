#!/bin/bash
#Script By Mohammad Fauzan R (fauzan121998@gmail.com) (0895703796928)
#Script auto create user SSH
clear
if [[ $USER != 'root' ]]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi
# cek ip
vps="mfauzan";
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
echo "------------------------ MEMBUAT AKUN SSH ------------------------"


	echo "      DEVELOPED BY Mohammad Fauzan R (089570379692)           "
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
echo -e "======================================"
echo -e "Data Login SSH PREMIUM :"
echo -e "------------------------------------"
echo -e "Host/IP: $MYIP" 
echo -e "Username: $username "
echo -e "Password: $password"
echo -e "    Dropbear Port: 22507, 110, 109, 80"
echo -e "    OpenSSH Port: 22, 143"
echo -e "    SSL/TLS Port: 443"
echo -e "    Port OVPN: 5555"
echo -e "    Squid Proxy: 3128, 8000, 8080"
echo -e "    Ovpn Config: http://$MYIP:81/client.ovpn"
echo -e "Aktif Sampai: $(date -d "$AKTIF days" +"%d-%b-%Y")"
echo -e "------------------------------------"
echo -e "======================================"
echo -e "Baca & Patuhi TOS/Terms Of Service"
echo -e " NO CARDING, TORRENT, ILEGAL CONTENT"
echo -e "--------------------------------------
echo -e "_________Powered BY BogelSSH_________"
echo -e "======================================"
echo -e ""
fi
