#!/bin/bash
wget -O /root/reboot_otomatis.sh "http://skrip.kerdunet.info/conf/debian/rebotauto.sh"
chmod +x /root/reboot_otomatis.sh
source="http://skrip.kerdunet.info"
cd /usr/local/bin
wget -O bench $source/app/debian/bench-network.sh
wget -O mem "https://raw.githubusercontent.com/pixelb/ps_mem/master/ps_mem.py"
wget -O userlog $source/conf/debian/userlog.sh
wget -O lock $source/conf/debian/lock.sh
wget -O usernew $source/conf/debian/usernew.sh
wget -O hapus $source/conf/debian/hapus.sh
wget -O userlimit $source/conf/debian/userlimit.sh
wget -O renew $source/conf/debian/renew.sh
wget -O userlist $source/conf/debian/userlist.sh
wget -O trial $source/conf/debian/trial.sh
wget -O baned $source/conf/debian/baned.sh
wget -O unbaned $source/conf/debian/unbaned.sh
wget -O menu $source/conf/debian/menu.sh
wget -O userexp $source/conf/debian/userexp.sh
wget -O gantipass $source/conf/debian/gantipass.sh
wget -O gen $source/conf/debian/generate.sh
wget -O tendang $source/conf/debian/tendang.sh
wget -O hapususerexp $source/conf/debian/hapususerexp.sh
wget -O speedtest $source/app/debian/speedtest_cli.py
echo "python /usr/bin/speedtest.py --share" | tee speedtest
wget -O speedtest $source/app/debian/speedtest_cli.py

chmod +x userlog
chmod +x hapus
chmod +x lock
chmod +x usernew
chmod +x userlist
chmod +x userlimit
chmod +x gen
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

useradd -M -s /bin/false AdityaWg
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
./shc -f /usr/local/bin/hapususerexp
mv /usr/local/bin/hapususerexp.x /usr/local/bin/hapususerexp
chmod +x /usr/local/bin/hapususerexp
