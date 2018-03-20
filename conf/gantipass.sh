#!/bin/bash
#Script By Mohammad Fauzan R (fauzan121998@gmail.com) (0895703796928)
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

echo "--------------------------- GANTI PASSWORD AKUN SSH & OVPN ---------------------------"
echo "                   DEVELOPED BY Mohammad Fauzan R (089570379692)                        "
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
		echo "======================================"
		echo "Data Login SSH PREMIUM :"
		echo "-----------------------------------"
		echo "Host/IP: $MYIP"
                echo "Username: $username"
                echo "Password: $password"
                echo -e "    Dropbear Port: 22507, 110, 109, 80"
                echo -e "    OpenSSH Port: 22, 143"
                echo -e "    SSL/TLS Port: 443"
                echo -e "    Squid Proxy: 3128, 8000, 8080"
		echo " OpenVPN Config: http://$MYIP:81/client.ovpn"
		echo "-----------------------------------"
		echo "======================================"
		echo -e "Baca & Patuhi TOS/Terms Of Service :"
                echo -e "    1. No DDOS, No HACKING"
                echo -e "    2. No CARDING, No SPAMING"
                echo -e "    3. No MULTI LOGIN"
                echo -e "    4. No TORENT"
                echo -e "    5. No VISIT SITE PORN"
                echo -e "    6. No GAME PLAYSTATION"
                echo -e ""
                echo -e "___Powered BY BogelSSH__"
                echo "======================================"
                echo -e ""
	else
		echo "Penggantian password akun [$username] Gagal"
		echo "[Password baru] & [Konfirmasi Password Baru] tidak cocok, silahkan ulangi lagi!"
	fi
else
	echo "Username [$username] belum terdaftar!"
	exit 1
fi
