#!/bin/bash
#Script By Mohammad Fauzan R (fauzan121998@gmail.com) (0895703796928)
vps="adityawg";
MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
if [ "$MYIP" = "" ]; then
	MYIP=$(wget -qO- ipv4.icanhazip.com)
fi

# cek ip
vps="adityawg";
MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
if [ "$MYIP" = "" ]; then
	MYIP=$(wget -qO- ipv4.icanhazip.com)
fi
wget -q -O adit https://raw.githubusercontent.com/mfauzan199812/Deb1/master/ip.txt
if ! grep -w -q $MYIP adit; then
	echo "Maaf, hanya IP yang terdaftar yang bisa menggunakan script ini!"
	if [[ $vps = "adityawg" ]]; then
		echo "Hubungi: Mohammad Fauzan R atau (0895703796928)"
	else
		echo "Hubungi: Mohammad Fauzan R atau (0895703796928)"
	fi
	rm /root/adit
	rm -f /root/adit
	exit
fi
echo "--------------------------- AUTO GENERATE AKUN SSH ---------------------------"
echo "                DEVELOPED BY Mohammad Fauzan R (089570379692)                    "
echo ""
read -p "Berapa jumlah akun yang akan dibuat: " JUMLAH
read -p "Berapa hari akun aktif: " AKTIF

today="$(date +"%Y-%m-%d")"
expire=$(date -d "$AKTIF days" +"%Y-%m-%d")

echo ""
echo "======================================"
echo "Data Login SSH PREMIUM :"
echo "-----------------------------------"
echo "Host/IP: $MYIP"
echo "    Dropbear Port: 22507, 109, 110, 80"
echo "    SSL/TLS Port: 443"
echo "    Squid Proxy: 8000, 8080, 3128"
echo "    OpenVPN Config: http://$MYIP:81/client.ovpn"

for (( i=1; i <= $JUMLAH; i++ ))
do
	USER=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 15 | head -n 1`;
	useradd -M -N -s /bin/false -e $expire $USER
	#PASS=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 15 | head -n 1`;
	echo $USER:$USER | chpasswd
	
	echo "$i. Username/Password: $USER"
done

echo "Masa Aktif sampai : $(date -d "$AKTIF days" +"%d-%m-%Y")"
echo "----------------------------------"
echo "======================================"
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
echo ""
