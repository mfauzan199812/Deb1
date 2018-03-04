#!/bin/bash
#Script By AdityaWg (adityawg@hotmail.com) (082210988552)
tanggal=$(date +"%m-%d-%Y")
waktu=$(date +"%T")
echo "Eksekusi Reboot Server Berhasil Pada $tanggal Pukul $waktu >> /root/log-reboot.txt
/sbin/shutdown -r now
