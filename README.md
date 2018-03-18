# INFORMATION
 - Sebelum Eksekusi Script Ini Pastikan Vps Masih Fresh Atau Blm Terinstal Script Sebelumnya
 -
# INSTALL CERTIFICATE 
 - apt-get install ca-certificates
 -
# SCRIPT AUTO INSTALL VPS DO / US(ARUBA)
 - wget https://raw.githubusercontent.com/mfauzan199812/Deb1/master/deb.sh && bash deb.sh
 -
 - atau Jika Ada Eror Bisa Pake Ini
 -
 - wget adityawg.ml/deb.sh && bash deb.sh
 -
# INSTALL VPS KHUSUS UNTUK OCS PANEL SAJA
 - wget https://raw.githubusercontent.com/mfauzan199812/Deb1/master/deb-ocs.sh && bash deb-ocs.sh
 -
# SCRIPT AUTO INSTALL SSL TUNNEL
 - wget https://raw.githubusercontent.com/mfauzan199812/Deb1/master/stnl.sh && bash stnl.sh
 -
# SCRIPT AUTO INSTALL OCS PANEL / PANEL BOGELSSH
 - wget https://raw.githubusercontent.com/mfauzan199812/Deb1/master/ocs.sh && bash ocs.sh
 -
 -
# UPDATE SCRIPT VPS / MENU
 - wget https://raw.githubusercontent.com/mfauzan199812/Deb1/master/update.sh && bash update.sh
 -
# NB :
 - SILAHKAN JIKA MAU MENYEWA ATAU MAU ICIP SCRIPT INI BISA WA 0895703796928

# dropbear
cd
wget https://raw.githubusercontent.com/kholizsivoi/script/master/dropbear-2017.75.tar.bz2
apt-get install zlib1g-dev
bzip2 -cd dropbear-2017.75.tar.bz2  | tar xvf -
cd dropbear-2017.75
./configure
make && make install
mv /usr/sbin/dropbear /usr/sbin/dropbear1
ln /usr/local/sbin/dropbear /usr/sbin/dropbear
service dropbear restart
rm -f /root/dropbear-2017.75.tar.bz2
