#!/bin/bash
clear
echo "------------------------ MENGECEK USER LOGIN ------------------------"


	echo "             DEVELOPED BY ADITYA WG (082210988552)             "
	echo ""
echo "                [ Checking Dropbear login ]                  ";
echo "-------------------------------------------------------------"
echo " Date-Time    |    PID   |    User Name    |     Dari IP "
echo "-------------------------------------------------------------"

data=( `ps aux | grep -i dropbear | awk '{print $2}'`);

for PID in "${data[@]}"
do
	#echo "check $PID";
	NUM=`cat /var/log/auth.log | grep -i dropbear | grep -i "Password auth succeeded" | grep "dropbear\[$PID\]" | wc -l`;
	USER=`cat /var/log/auth.log | grep -i dropbear | grep -i "Password auth succeeded" | grep "dropbear\[$PID\]" | awk -F" " '{print $10}'`;
	IP=`cat /var/log/auth.log | grep -i dropbear | grep -i "Password auth succeeded" | grep "dropbear\[$PID\]" | awk -F" " '{print $12}'`;
	waktu=`cat /var/log/auth.log | grep -i dropbear | grep -i "Password auth succeeded" | grep "dropbear\[$PID\]" | awk -F" " '{print $1,$2,$3}'`;
	if [ $NUM -eq 1 ]; then
		echo "$waktu - $PID - $USER - $IP";
	fi
done


echo "-------------------------------------------------------------"
echo ""
echo ""
echo "                 [ Checking OpenSSH login ]                  ";
echo "-------------------------------------------------------------"
echo " Date-Time    |    PID   |    User Name    |     Dari IP "
echo "-------------------------------------------------------------"

data=( `ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'`);

for PID in "${data[@]}"
do
        #echo "check $PID";
		NUM=`cat /var/log/auth.log | grep -i sshd | grep -i "Accepted password for" | grep "sshd\[$PID\]" | wc -l`;
		USER=`cat /var/log/auth.log | grep -i sshd | grep -i "Accepted password for" | grep "sshd\[$PID\]" | awk '{print $9}'`;
		IP=`cat /var/log/auth.log | grep -i sshd | grep -i "Accepted password for" | grep "sshd\[$PID\]" | awk '{print $11}'`;
		waktu=`cat /var/log/auth.log | grep -i sshd | grep -i "Accepted password for" | grep "sshd\[$PID\]" | awk '{print $1,$2,$3}'`;
        if [ $NUM -eq 1 ]; then
                echo "$waktu - $PID - $USER - $IP";
        fi
done

echo "-------------------------------------------------------------"
