#Sebelum Eksekusi Script Ini Pastikan Vps Masih Fresh Atau Blm Terinstal 


# INSTALL CERTIFICATE 
apt-get install ca-certificates

# SCRIPT AUTO INSTALL VPS DO / US(ARUBA)
wget https://raw.githubusercontent.com/mfauzan199812/Deb1/master/deb.sh && bash deb.sh


atau


wget adityawg.ml/deb.sh && bash deb.sh

# SCRIPT AUTO INSTALL SSL
wget https://raw.githubusercontent.com/mfauzan199812/Deb1/master/stnl.sh && bash stnl.sh

# SCRIPT AUTO INSTALL OCS PANEL
wget https://raw.githubusercontent.com/mfauzan199812/Deb1/master/ocs.sh && bash ocs.sh

# INSTALL VPS UNTUK OCS PANEL
wget https://raw.githubusercontent.com/mfauzan199812/Deb1/master/deb-ocs.sh && bash deb-ocs.sh
