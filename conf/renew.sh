#!/bin/bash
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
echo "--------------------PERPANJANG MASA AKTIF AKUN-------------------"
echo "                DEVELOPED BY ADITYA (082210988552)               "
echo ""

# begin of user-list
echo "-----------------------------------"
echo "USERNAME              EXP DATE     "
echo "-----------------------------------"

while read expired
do
	AKUN="$(echo $expired | cut -d: -f1)"
	ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
	exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
	if [[ $ID -ge 1000 ]]; then
		printf "%-21s %2s\n" "$AKUN" "$exp"
	fi
done < /etc/passwd
echo "-----------------------------------"
echo ""
# end of user-list

 if [ $(id -u) -eq 0 ]; then
        read -p "Akun yg ingin diperpanjang: " username
        read -p "Tambah masa aktif berapa hari: " tambah
        if ! [[ "$tambah" =~ ^[0-9]+$ ]] ;
        then exec >&2; echo "ERROR! Ngelindur ya bro? Hanya bisa diisi angka tuh!!"; exit 1
fi
        egrep "^${username}:" /etc/passwd >/dev/null
        if [ "$username" = "" ]
        then
                echo "ERROR! Akun $username tidak ada di server. Cek lagi!"
                exit 1
        else
                exp="$(chage -l $username | grep "Account expires" | awk -F": " '{print $2}')"
                usermod -U -e `date -d "$tambah days $exp" +"%Y-%m-%d"` $username &> /dev/null
                [ $? -eq 0 ] && echo "SUKSES! TGL EXPIRE LAMA: `date -d "$exp" +"%d-%b-%Y"` ========> MENJADI: `date -d "$tambah days $exp" +"%d-%b-%Y"`" || echo "Error! "
                echo "---------------------------------------------------------------------"
        fi
else
        echo "Hanya root yang bisa menjalankan perintah ini"
        exit 2
fi
