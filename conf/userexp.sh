#!/bin/bash
clear
if [[ $USER != 'root' ]]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi
# cek ip
vps="adityawg";
MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
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
echo "------------------------ MELIHAT SEMUA AKUN YANG EXPIRED ------------------------"


	echo "              DEVELOPED BY ADITYA WG (082210988552)              "
echo ""
echo "---------------------------------"
echo "BIL  USERNAME          EXPIRED "
echo "---------------------------------"
count=1
	cat /etc/shadow | cut -d: -f1,8 | sed /:$/d > /tmp/expirelist.txt
	totalaccounts=`cat /tmp/expirelist.txt | wc -l`
	for((i=1; i<=$totalaccounts; i++ )); do
	tuserval=`head -n $i /tmp/expirelist.txt | tail -n 1`
		username=`echo $tuserval | cut -f1 -d:`
		userexp=`echo $tuserval | cut -f2 -d:`
		userexpireinseconds=$(( $userexp * 86400 ))
		todaystime=`date +%s`
		expired="$(chage -l $username | grep "Account expires" | awk -F": " '{print $2}')"
		if [ $userexpireinseconds -lt $todaystime ] ; then
			printf "%-4s %-15s %-10s %-3s\n" "$count." "$username" "$expired"
			count=$((count+1))
		fi
	done
	rm /tmp/expirelist.txt
