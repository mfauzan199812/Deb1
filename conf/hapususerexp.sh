#!/bin/bash

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

#ip=`ifconfig venet0:0 | grep 'inet addr' | awk {'print $2'} | sed s/.*://`
MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
#MYIP=$(ifconfig | grep 'inet addr:' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d: -f2 | awk '{ print $1}' | head -1)
if [ "$MYIP" = "" ]; then
	MYIP=$(wget -qO- ipv4.icanhazip.com)
fi

echo "" > /root/infouser.txt
echo "" > /root/expireduser.txt
echo "" > /root/activeuser.txt
echo "" > /root/alluser.txt

cat /etc/shadow | cut -d: -f1,8 | sed /:$/d > /tmp/expirelist.txt
totalaccounts=`cat /tmp/expirelist.txt | wc -l`
for((i=1; i<=$totalaccounts; i++ ))
do
	tuserval=`head -n $i /tmp/expirelist.txt | tail -n 1`
	username=`echo $tuserval | cut -f1 -d:`
	userexp=`echo $tuserval | cut -f2 -d:`
	userexpireinseconds=$(( $userexp * 86400 ))
	tglexp=`date -d @$userexpireinseconds`
	tgl=`echo $tglexp |awk -F" " '{print $3}'`
	while [ ${#tgl} -lt 2 ]
	do
		tgl="0"$tgl
	done
	while [ ${#username} -lt 15 ]
	do
		username=$username" "
	done
	bulantahun=`echo $tglexp |awk -F" " '{print $2,$6}'`
	echo " User : $username Expire tanggal : $tgl $bulantahun" >> /root/alluser.txt
	todaystime=`date +%s`
	if [ $userexpireinseconds -ge $todaystime ]; then
		echo " User : $username Expire tanggal : $tgl $bulantahun" >> /root/activeuser.txt
		timeto7days=$(( $todaystime + 604800 ))
		if [ $userexpireinseconds -le $timeto7days ]; then
			echo " User : $username Expire tanggal : $tgl $bulantahun" >> /root/infouser.txt
		fi
	else
		echo " User : $username Expire tanggal : $tgl $bulantahun" >> /root/expireduser.txt
		passwd -l $username
		userdel $username
	fi
done
echo "SEMUA USER EXPIRED BERHASIL DIHAPUS !"
