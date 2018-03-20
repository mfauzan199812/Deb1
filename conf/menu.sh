#!/bin/bash
#Script By Mohammad Fauzan R (fauzan121998@gmail.com) (0895703796928)
            red='\e[1;31m'
            green='\e[0;32m'
	    blue='\e[1;24m'
            NC='\e[0m'
            echo "Connecting to BogelSSH TEAM..."
            sleep 0.2
            echo "Checking Permision..."
            sleep 0.3
            echo -e "${green}Permission Accepted...${NC}"
            sleep 1
            echo""
clear
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

rm -rf $HOME/bench.log
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo | sed 's/^[ \t]*//;s/[ \t]*$//' )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo | sed 's/^[ \t]*//;s/[ \t]*$//' )
tram=$( free -m | awk 'NR==2 {print $2}' )
vram=$( free -m | awk 'NR==4 {print $2}' )
up=$( uptime | awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }' | sed 's/^[ \t]*//;s/[ \t]*$//' )
	# Output of result
echo -e ""
echo -e "____________________|•Welcome To Server Premium BogelSSH Team•|_________________________"
echo -e "______________________<<< Jangan Lupa Bahagia Ea Hari Ini >>>___________________________"
echo -e ""
echo -e "                ============ Os Debian 32-bit & 64-bit ============ "
echo -e "                                   Modder Script "
echo -e "                        Mohammad Fauzan R | Wa 0895703796928 "
echo -e "                              ---------------------- "
echo -e "                             |  Information System  |"
echo -e "                      --------------------------------------- "
echo -e "                             \e[032;1mServer Ip:\e[0m $MYIP"
echo -e "               \e[032;1mCPU model:\e[0m $cname"
echo -e "                                \e[032;1mNumber of cores:\e[0m $cores"
echo -e "                           \e[032;1mCPU frequency:\e[0m $freq MHz"
echo -e "                       \e[032;1mTotal amount of ram:\e[0m $tram MB"
echo -e "                          \e[032;1mTotal amount of swap:\e[0m $vram MB"
echo -e "                            \e[032;1mSystem uptime:\e[0m $up$"
echo -e "          ----------------------------------------------------------------"
echo -e ""
echo -e "               ${green}Apa Yang Ingin Anda Lakukan Sekarang Ini Sob?${NC}"
echo -e "                    __________________________________________"
echo -e ""
PS3='Silahkan Ketik Angka Pilihan Anda Lalu Enter Ya Sob : '
options=("Buat Akun SSH & OVPN" "Buat Akun Trial SSH & OVPN" "Generate Akun SSH & OVPN" "Perbarui Masa Aktif Akun" "Hapus Akun SSH & OVPN" "Ganti Password Akun SSH & OVPN" "Lihat Semua Akun SSH & OVPN" "Lihat Semua Akun Yang Expired" "Kunci Akun Yang Sudah Expired" "Hapus Akun Yang Sudah Expired" "Monitor Akun Yang Multi Login" "Sleding Akun Yang Multi Login" "On Autokill" "Off Autokill" "Auto Install Script TLS/SSL" "Auto Install Script OCS Panel Premium" "Ram Status" "Hapus Cache Ram" "Penggunaan Data Oleh User" "Banned Akun SSH & OVPN" "Unbanned Akun SSH & OVPN" "Test Kecepatan Server" "Edit Baner Login" "Nyalakan Auto Reboot VPS 12 Jam Sekali" "Nyalakan Auto Reboot VPS 24 Jam Sekali" "Melihat Log Auto Reboot VPS" "Off Auto Reboot VPS" "Ganti Password VPS" "Lihat Lokasi User" "Restart Server [reboot]" "Restart Webmin [service webmin restart]" "Restart Dropbear [service dropbear restart]" "Restart Squid [service squid restart]" "Restart Semuanya" "Update Premium Script" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Buat Akun SSH & OVPN")
	 clear
           usernew
	    break
            ;;
            "Buat Akun Trial SSH & OVPN")
	clear
	    trial
            break
            ;;	
            "Generate Akun SSH & OVPN")
            clear
            gen
            break
            ;;
        "Perbarui Masa Aktif Akun")
	    clear
	     renew
            break
            ;;
        "Hapus Akun SSH & OVPN")
	 clear
	    hapus
            break
            ;;
            "Ganti Password Akun SSH & OVPN")
		clear
		 gantipass
			break			
                        ;;
		"Lihat Semua Akun SSH & OVPN")
		clear
		userlist
			break
			;;
		"Lihat Semua Akun Yang Expired")
		clear
			userexp
			break
			;;		
		 "Kunci Akun Yang Sudah Expired")
	    clear
	    lock
	    break
	    ;;
	    "Hapus Akun Yang Sudah Expired")
	clear
	       hapususerexp
	    break
	    ;;
	    "Monitor Akun Yang Multi Login")
       clear
              userlog
                break
	          ;;
		"Sleding Akun Yang Multi Login")
		clear
			tendang
			break
			;;	
			"On Autokill")
		clear 
echo "--------------------- MENGAKTIFKAN AUTOKILL ----------------------"
echo "          MODIFIED BY Mohammad Fauzan R (089570379692)              "
echo ""
read -p "Isikan Maximal User Login (1-2): " MULTILOGIN2
echo "* * * * * root /usr/local/bin/userlimit $MULTILOGIN2" > /etc/cron.d/userlimit1
echo "* * * * * root sleep 10; /usr/local/bin/userlimit $MULTILOGIN2" > /etc/cron.d/userlimit2
echo "* * * * * root sleep 20; /usr/local/bin/userlimit $MULTILOGIN2" > /etc/cron.d/userlimit3
echo "* * * * * root sleep 30; /usr/local/bin/userlimit $MULTILOGIN2" > /etc/cron.d/userlimit4
echo "* * * * * root sleep 40; /usr/local/bin/userlimit $MULTILOGIN2" > /etc/cron.d/userlimit5
echo "* * * * * root sleep 50; /usr/local/bin/userlimit $MULTILOGIN2" > /etc/cron.d/userlimit6
echo "* * * * * root /usr/local/bin/userlimit $MULTILOGIN2" >> /etc/cron.d/userlimit1
echo "* * * * * root sleep 11; /usr/local/bin/userlimit $MULTILOGIN2" >> /etc/cron.d/userlimit2
echo "* * * * * root sleep 21; /usr/local/bin/userlimit $MULTILOGIN2" >> /etc/cron.d/userlimit3
echo "* * * * * root sleep 31; /usr/local/bin/userlimit $MULTILOGIN2" >> /etc/cron.d/userlimit4
echo "* * * * * root sleep 41; /usr/local/bin/userlimit $MULTILOGIN2" >> /etc/cron.d/userlimit5
echo "* * * * * root sleep 51; /usr/local/bin/userlimit $MULTILOGIN2" >> /etc/cron.d/userlimit6
service cron restart
service ssh restart
service dropbear restart
echo "   + AUTO KILL SUDAH DI AKTIFKAN BOSKU, JANGAN LUPA DINON AKTIFKAN +    "
			break
			;;	
			"Off Autokill")
		clear
	rm -rf /etc/cron.d/userlimit1
	rm -rf /etc/cron.d/userlimit2
	rm -rf /etc/cron.d/userlimit3
	rm -rf /etc/cron.d/userlimit4
	rm -rf /etc/cron.d/userlimit5
	rm -rf /etc/cron.d/userlimit6
	service cron restart
	    service ssh restart
	    service dropbear restart
	clear
echo "------------+ AUTO KILL SUDAH DI NONAKTIFKAN BOSS+--------------"
			break
			;;	
                "Auto Install Script TLS/SSL")
                wget https://raw.githubusercontent.com/mfauzan199812/Deb1/master/stnl.sh && bash stnl.sh
                clear
		break
                ;;
                "Auto Install Script OCS Panel Premium")
		wget https://raw.githubusercontent.com/mfauzan199812/Deb1/master/ocs.sh && bash ocs.sh
                clear
                break
                ;;
		"Ram Status")
		    clear
		    free -h | grep -v + > /tmp/ramcache
            cat /tmp/ramcache | grep -v "Swap"
            break
              ;;
	      "Hapus Cache Ram")
	      clear
	echo "Sebelum......" 
        free -h
	echo 1 > /proc/sys/vm/drop_caches
	sleep 1
	echo 2 > /proc/sys/vm/drop_caches
	sleep 1
	echo 3 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a
	sleep 1
	echo ""
	echo "Sesudah......" 
	free -h
	echo "SUKSES EA..!!!Cache Ram Anda Sudah Di Bersihkan."
        break
	;;
        "Penggunaan Data Oleh User")
        myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`
        myint=`ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}'`
        ifconfig $myint | grep "RX bytes" | sed -e 's/ *RX [a-z:0-9]*/Received: /g' | sed -e 's/TX [a-z:0-9]*/\nTransfered: /g'
        break
        ;;
		"Banned Akun SSH & OVPN")	
		clear
	    baned
			break
			;;
		"Unbanned Akun SSH & OVPN")
		clear
	    unbaned
			break
			;;
        "Test Kecepatan Server")
        clear
	speedtest --share
	break
            ;;
            "Edit Baner Login")
	clear
	echo "----------------------MENGEDIT BANER LOGIN-----------------------"
	echo "           MODIFIED BY Mohammad Fauzan R (089570379692)              "
	echo ""
	echo "-----------------------------------------------------------------"
	echo -e "1.) Simpan text (CTRL + X, lalu ketik Y dan tekan Enter) "
	echo -e "2.) Membatalkan edit text (CTRL + X, lalu ketik N dan tekan Enter)"
	echo "-----------------------------------------------------------------"
	read -p "Tekan ENTER untuk melanjutkan........................ "
	nano /etc/baner
	service dropbear restart && service ssh restart
	break
	;;
	"Nyalakan Auto Reboot VPS 12 Jam Sekali")
	clear
	echo "----------------------MENYALAKAN AUTO REBOOT OTOMATIS 12 JAM SEKALI-----------------------"
	echo "                       MODIFIED BY Mohammad Fauzan R (089570379692)                           "
	echo "0 */12 * * * root /root/reboot_otomatis.sh" > /etc/cron.d/reboot_otomatis
	echo "Auto Reboot Berhasil Dinyalakan Setiap 12 Jam Sekali"
	break
	;;
	"Nyalakan Auto Reboot VPS 1 Hari Sekali")
	clear
	echo "----------------------MENYALAKAN AUTO REBOOT OTOMATIS 1 HARI SEKALI-----------------------"
	echo "                       MODIFIED BY Mohammad Fauzan R (089570379692)                          "
	echo "0 0 * * * root /root/reboot_otomatis.sh" > /etc/cron.d/reboot_otomatis
	echo "Auto Reboot Berhasil Dinyalakan Setiap 1 Hari Sekali"
	break
	;;
	"Melihat Log Auto Reboot VPS")
	clear
	echo "----------------------MELIHAT LOG AUTOREBOOT VPS-----------------------"
	echo "             MODIFIED BY Mohammad Fauzan R (089570379692)                 "
	cat /root/log-reboot.txt
	break
	;;
	"Off Auto Reboot VPS")
	clear
	echo "----------------------MEMATIKAN AUTOREBOOT VPS-----------------------"
	echo "             MODIFIED BY Mohammad Fauzan R (089570379692)               "
	rm -f /etc/cron.d/reboot_otomatis
	echo "Auto Reboot Berhasil Dimatikan"
	break
	;;
	    "Ganti Password VPS")
	    read -p "Silahkan isi password baru untuk VPS anda: " pass	
        echo "root:$pass" | chpasswd
	    echo "Password vps anda berhasil diganti menjadi $pass"
	    break
	    ;;
	    "Lihat Lokasi User")
	    clear
	    userlog
            read -p "Ketik Salah Satu Alamat IP User: " userip
            curl ipinfo.io/$userip
            break
            ;;
	    "Restart Server [reboot]")
	    reboot
	    break
	    ;;
	    "Restart Webmin [service webmin restart]")
	    service webmin restart
	    break
	    ;;
	    "Restart Dropbear [service dropbear restart]")
	    service dropbear restart
	    break
	    ;;
	    "Restart Squid [service squid3 restart]")
	    service squid3 restart
	    break
	    ;;
	    "Restart Semuanya")
	    clear
	    service cron restart
            service nginx start
            service php-fpm start
            service vnstat restart
            service snmpd restart
            service ssh restart
            service openvpn restart
            service dropbear restart
            service fail2ban restart
            service squid3 restart
            service webmin restart
            service stunnel4 restart
	    break
	    ;;
	    "Update Premium Script")
	    clear
	    wget https://raw.githubusercontent.com/mfauzan199812/Deb1/master/update.sh && bash update.sh
	    break
	    ;;
	    "Quit")
	    break
	    ;;
        *) echo invalid option;;
    esac
done
