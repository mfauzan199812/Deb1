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

echo "--------------------------- GANTI PASSWORD AKUN SSH & OVPN ---------------------------" | lolcat
echo "                   DEVELOPED BY Mohammad Fauzan R (089570379692)                        " | 
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

read -p "Isikan username: " username

egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
	read -p "Isikan password baru akun [$username]: " password
	read -p "Konfirmasi password baru akun [$username]: " password1
	echo ""
	if [[ $password = $password1 ]]; then
		echo $username:$password | chpasswd
		echo "Penggantian password akun [$username] Sukses"
		echo ""
		echo "======================================" | lolcat
		echo "Data Login SSH PREMIUM" | lolcat
		echo -e "-------------------------------------" | lolcat
                echo -e "Host/IP: $MYIP" | lolcat
                echo -e "Username: $username " | lolcat
                echo -e "Password: $password" | lolcat
                echo -e "    Dropbear Port: 22507, 110, 109, 80" | lolcat
                echo -e "    OpenSSH Port: 22, 143" | lolcat
                echo -e "    SSL/TLS Port: 443" | lolcat
                echo -e "    Port OVPN: 5555" | 
                echo -e "    Squid Proxy: 3128, 8000, 8080" | lolcat
                echo -e "    Ovpn Config: http://$MYIP:81/client.ovpn" | lolcat
                echo -e "Aktif Sampai: $(date -d "$AKTIF days" +"%d-%b-%Y")" | lolcat
                echo -e "-------------------------------------" | lolcat
                echo -e "======================================" | lolcat
                echo -e "Baca & Patuhi TOS/Terms Of Service" | lolcat
                echo -e " NO CARDING, TORRENT, ILEGAL CONTENT" | lolcat
                echo -e "-------------------------------------" | lolcat
                echo -e "_________Powered BY BogelSSH_________" | lolcat
                echo -e "======================================" | lolcat
                echo -e ""
	else
		echo "Penggantian password akun [$username] Gagal"
		echo "[Password baru] & [Konfirmasi Password Baru] tidak cocok, silahkan ulangi lagi!"
	fi
else
	echo "Username [$username] belum terdaftar!"
	exit 1
fi
