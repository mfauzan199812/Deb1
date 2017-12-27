#!/bin/bash
clear
# cek ip
vps="adityawg";
MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;


echo -e "----------------- Menendang User Yg Multi Login --------------------"
read -p "Berapa Multi Login Yg Akan Ditendang (1-2):" limit
userlimit $limit
