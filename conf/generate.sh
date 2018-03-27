#!/bin/bash
#Script By Mohammad Fauzan R (fauzan121998@gmail.com) (0895703796928)
vps="mfauzan";
MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
if [ "$MYIP" = "" ]; then
	MYIP=$(wget -qO- ipv4.icanhazip.com)
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
echo "--------------------------- AUTO GENERATE AKUN SSH ---------------------------"
echo "                DEVELOPED BY Mohammad Fauzan R (089570379692)                    "
echo ""
read -p "Berapa jumlah akun yang akan dibuat: " JUMLAH
read -p "Berapa hari akun aktif: " AKTIF

today="$(date +"%Y-%m-%d")"
expire=$(date -d "$AKTIF days" +"%Y-%m-%d")

echo ""
echo "======================================"
echo "Data Login SSH PREMIUM"
echo "-----------------------------------"
echo "Host/IP: $MYIP"
echo "    Dropbear Port: 22507, 109, 110, 80"
echo "    OpenSSH Port: 22,143"
echo "    SSL/TLS Port: 443"
echo "    Port OVPN: 5555"
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

echo "Masa Aktif sampai : $(date -d "$AKTIF days" +"%d-%b-%Y")"
echo -e "------------------------------------"
echo -e "======================================"
echo -e "Baca & Patuhi TOS/Terms Of Service"
echo -e " NO CARDING, TORRENT, ILEGAL CONTENT"
echo -e "--------------------------------------"
echo -e "_________Powered BY BogelSSH_________"
echo -e "======================================"
echo ""
