#!/bin/bash
clear
if [[ $USER != 'root' ]]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi
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
echo "--------------------- MELIHAT SEMUA AKUN SSH & OVPN -----------------------"


	echo "            DEVELOPED BY ADITYA WG (082210988552)            "
echo ""
echo "-------------------------------"
echo "USERNAME        TANGGAL EXPIRED"
echo "-------------------------------"
while read adityawg
do
        AKUN="$(echo $adityawg | cut -d: -f1)"
        ID="$(echo $adityawg | grep -v nobody | cut -d: -f3)"
        exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
        if [[ $ID -ge 500 ]]; then
        printf "%-17s %2s\n" "$AKUN" "$exp"
		fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 500 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo "-------------------------------"
echo "Jumlah akun: $JUMLAH user"
echo "-------------------------------"
echo ""
