#!/bin/bash
#Script By Mohammad Fauzan R (fauzan121998@gmail.com) (0895703796928)
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

wget -O /root/reboot_otomatis.sh "https://raw.githubusercontent.com/mfauzan199812/Deb1/master/conf/rebotauto.sh"
chmod +x /root/reboot_otomatis.sh
source="https://raw.githubusercontent.com/mfauzan199812/Deb1/master"
cd /usr/local/bin
wget -O bench "https://raw.githubusercontent.com/mfauzan199812/Deb1/master/file/bench-network.sh"
wget -O mem "https://raw.githubusercontent.com/pixelb/ps_mem/master/ps_mem.py"
wget -O userlog $source/conf/userlog.sh
wget -O lock $source/conf/lock.sh
wget -O usernew $source/conf/usernew.sh
wget -O hapus $source/conf/hapus.sh
wget -O userlimit $source/conf/userlimit.sh
wget -O renew $source/conf/renew.sh
wget -O userlist $source/conf/userlist.sh
wget -O trial $source/conf/trial.sh
wget -O baned $source/conf/baned.sh
wget -O unbaned $source/conf/unbaned.sh
wget -O menu $source/conf/menu.sh
wget -O userexp $source/conf/userexp.sh
wget -O gantipass $source/conf/gantipass.sh
wget -O gen $source/conf/generate.sh
wget -O about $source/conf/about.sh
wget -O tendang $source/conf/tendang.sh
wget -O hapususerexp $source/conf/hapususerexp.sh
wget -O speedtest $source/conf/speedtest_cli.py
echo "python /usr/bin/speedtest.py --share" | tee speedtest
wget -O speedtest $source/conf/speedtest_cli.py

chmod +x userlog
chmod +x hapus
chmod +x lock
chmod +x usernew
chmod +x userlist
chmod +x userlimit
chmod +x gen
chmod +x about
chmod +x gantipass
chmod +x renew
chmod +x trial
chmod +x menu
chmod +x speedtest
chmod +x speedtest_cli.py
chmod +x bench
chmod +x mem
chmod +x baned
chmod +x unbaned
chmod +x userexp
chmod +x hapususerexp
chmod +x tendang

useradd -M -s /bin/false mfauzan
# shc file
cd
apt-get install make
cd
wget https://raw.githubusercontent.com/yusuf-ardiansyah/vultur/master/shc-3.8.7.tgz
tar xvfz shc-3.8.7.tgz
cd shc-3.8.7
make
./shc -f /usr/local/bin/menu
mv /usr/local/bin/menu.x /usr/local/bin/menu
chmod +x /usr/local/bin/menu
cd shc-3.8.7
make
./shc -f /usr/local/bin/usernew
mv /usr/local/bin/usernew.x /usr/local/bin/usernew
chmod +x /usr/local/bin/usernew
cd shc-3.8.7
make
./shc -f /usr/local/bin/renew
mv /usr/local/bin/renew.x /usr/local/bin/renew
chmod +x /usr/local/bin/renew
cd shc-3.8.7
make
./shc -f /usr/local/bin/userlist
mv /usr/local/bin/userlist.x /usr/local/bin/userlist
chmod +x /usr/local/bin/userlist
cd shc-3.8.7
make
./shc -f /usr/local/bin/userlog
mv /usr/local/bin/userlog.x /usr/local/bin/userlog
chmod +x /usr/local/bin/userlog
cd shc-3.8.7
make
./shc -f /usr/local/bin/baned
mv /usr/local/bin/baned.x /usr/local/bin/baned
chmod +x /usr/local/bin/baned
cd shc-3.8.7
make
./shc -f /usr/local/bin/unbaned
mv /usr/local/bin/unbaned.x /usr/local/bin/unbaned
chmod +x /usr/local/bin/unbaned
cd shc-3.8.7
make
./shc -f /usr/local/bin/gantipass
mv /usr/local/bin/gantipass.x /usr/local/bin/gantipass
chmod +x /usr/local/bin/gantipass
cd shc-3.8.7
make
./shc -f /usr/local/bin/userexp
mv /usr/local/bin/userexp.x /usr/local/bin/userexp
chmod +x /usr/local/bin/userexp
cd shc-3.8.7
make
./shc -f /usr/local/bin/lock
mv /usr/local/bin/lock.x /usr/local/bin/lock
chmod +x /usr/local/bin/lock
cd shc-3.8.7
make
./shc -f /usr/local/bin/hapus
mv /usr/local/bin/hapus.x /usr/local/bin/hapus
chmod +x /usr/local/bin/hapus
cd shc-3.8.7
make
./shc -f /usr/local/bin/trial
mv /usr/local/bin/trial.x /usr/local/bin/trial
chmod +x /usr/local/bin/trial
cd shc-3.8.7
make
./shc -f /usr/local/bin/gen
mv /usr/local/bin/gen.x /usr/local/bin/gen
chmod +x /usr/local/bin/gen
cd shc-3.8.7
make
./shc -f /usr/local/bin/about
mv /usr/local/bin/about.x /usr/local/bin/about
chmod +x /usr/local/bin/about
cd shc-3.8.7
make
./shc -f /usr/local/bin/hapususerexp
mv /usr/local/bin/hapususerexp.x /usr/local/bin/hapususerexp
chmod +x /usr/local/bin/hapususerexp

clear
