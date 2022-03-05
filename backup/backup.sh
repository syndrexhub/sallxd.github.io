#!/bin/bash
clear
ips=$(wget -qO- ipinfo.io/ip);
chatid="";
api="";
date=$(date +"%Y-%m-%d" | cut -d "-" -f 2-3);
time=$(date +"%H:%M:%S" | cut -d ":" -f 1-2);
rm -f $ips-$date-$time.zip
rm -rf /root/backup
mkdir /root/backup
cd /root
cp /etc/passwd /root/backup
cp /etc/group /root/backup
cp /etc/shadow /root/backup
cp /etc/gshadow /root/backup
cp -r /etc/v2ray /root/backup/v2ray
cp -r /etc/trojan /root/backup/trojan
cp -r /home/vps/public_html /root/backup/public_html
cd /root
zip -r $ips-$date-$time.zip backup > /dev/null 2>&1
curl -F document=@"$ips-$date-$time.zip" https://api.telegram.org/bot$api/sendDocument?chat_id=$chatid
rm -f $ips-$date-$time.zip
