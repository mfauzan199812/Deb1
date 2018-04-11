#!/bin/bash
#Script By Mohammad Fauzan R (fauzan121998@gmail.com) (0895703796928)
clear
echo "------------------------ MENGECEK USER LOGIN ------------------------" | lolcat
echo "           DEVELOPED BY Mohammad Fauzan R (089570379692)             " | lolcat
echo ""
echo "                            _\|/_                               " | lolcat
echo "                            (o o)                               " | lolcat
echo "-------------------------o00-{_}-00o-------------------------   " | lolcat
echo "=============================================================   " | lolcat
echo "                [ Checking Dropbear login ]                  "; | lolcat
echo "-------------------------------------------------------------" | lolcat
echo " Date-Time    |    PID   |    User Name    |     Dari IP " | lolcat
echo "-------------------------------------------------------------" | lolcat

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


echo "-------------------------------------------------------------" | lolcat
echo ""
echo ""
echo "                 [ Checking OpenSSH login ]                  "; | lolcat
echo "-------------------------------------------------------------" | lolcat
echo " Date-Time    |    PID   |    User Name    |     Dari IP " | lolcat
echo "-------------------------------------------------------------" | lolcat

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

echo "-------------------------------------------------------------" | lolcat
