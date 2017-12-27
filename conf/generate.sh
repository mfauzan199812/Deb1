#!/bin/bash
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
echo "--------------------------- AUTO GENERATE AKUN SSH ---------------------------"
echo "                    DEVELOPED BY ADITYAWG (082210988552)                      "
echo ""
read -p "Berapa jumlah akun yang akan dibuat: " JUMLAH
read -p "Berapa hari akun aktif: " AKTIF

today="$(date +"%Y-%m-%d")"
expire=$(date -d "$AKTIF days" +"%Y-%m-%d")

echo ""
echo "-----------------------------------------------------------------"
echo "Data Login:"
echo "-----------------------------------------------------------------"
echo "Host/IP: $MYIP"
echo "Dropbear Port: 443,109,110,80"
echo "OpenSSH Port: 22,143"
echo "Squid Proxy: 8000,8080,3128"
echo "OpenVPN: http://$MYIP:81/client.ovpn"

for (( i=1; i <= $JUMLAH; i++ ))
do
	USER=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 15 | head -n 1`;
	useradd -M -N -s /bin/false -e $expire $USER
	#PASS=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 15 | head -n 1`;
	echo $USER:$USER | chpasswd
	
	echo "$i. Username/Password: $USER"
done

echo "Masa Aktif sampai : $(date -d "$AKTIF days" +"%d-%m-%Y")"
echo -e "================================================================"
