#!/bin/bash
#Script By Mohammad Fauzan R (fauzan121998@gmail.com) (0895703796928)
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
echo "--------------------PERPANJANG MASA AKTIF AKUN-------------------" | lolcat
echo "         DEVELOPED BY Mohammad Fauzan R (089570379692)            " | lolcat
echo ""

# begin of user-list
echo "-----------------------------------" | lolcat
echo "USERNAME              EXP DATE     " | lolcat
echo "-----------------------------------" | lolcat

while read expired
do
	AKUN="$(echo $expired | cut -d: -f1)"
	ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
	exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
	if [[ $ID -ge 1000 ]]; then
		printf "%-21s %2s\n" "$AKUN" "$exp"
	fi
done < /etc/passwd
echo "-----------------------------------" | lolcat
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
                echo "---------------------------------------------------------------------" | lolcat
        fi
else
        echo "Hanya root yang bisa menjalankan perintah ini"
        exit 2
fi
