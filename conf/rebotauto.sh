#!/bin/bash
#Script By Mohammad Fauzan R (fauzan121998@gmail.com) (0895703796928)
tanggal=$(date +"%m-%d-%Y")
waktu=$(date +"%T")
echo "Eksekusi Reboot Server Berhasil Pada $tanggal Pukul $waktu >> /root/log-reboot.txt
/sbin/shutdown -r now
