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
cp -r /var/lib/geovpnstore/ /root/backup/geovpnstore
cp -r /home/sstp /root/backup/sstp
cp -r /etc/xray /root/backup/xray
cp -r /etc/trojan-go /root/backup/trojan-go
cp -r /usr/local/shadowsocksr/ /root/backup/shadowsocksr
cp -r /home/vps/public_html /root/backup/public_html
cp -r /etc/cron.d /root/backup/cron.d
cp /etc/crontab /root/backup/crontab
cd /root
zip -r $ips-$date-$time.zip backup > /dev/null 2>&1
curl -F document=@"$ips-$date-$time.zip" https://api.telegram.org/bot$api/sendDocument?chat_id=$chatid
rm -f $ips-$date-$time.zip
