#!/bin/bash
# My Telegram : https://t.me/sampiiiiu
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

BURIQ () {
    curl -sS https://raw.githubusercontent.com/sallxd/perizinan/main/main/allow > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipinfo.io/ip)
Name=$(curl -sS https://raw.githubusercontent.com/sallxd/perizinan/main/main/allow | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipinfo.io/ip)
    IZIN=$(curl -sS https://raw.githubusercontent.com/sallxd/perizinan/main/main/allow | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION

if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi
clear
# =========================================

#cek port dan tampilkan

ws="$(cat ~/log-install.txt | grep -w "Websocket TLS" | cut -d: -f2|sed 's/ //g')"

#input port untuk pengganti
echo -e "======================================"
echo -e ""
echo -e "Change Port $ws"
echo -e ""
echo -e "======================================"
read -p "New Port SSH WS : " ws2
if [ -z $ws2 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $ws2)
if [[ -z $cek ]]; then


#ganti port layanan
sed -i "s/$ws/$ws2/g" /etc/default/sslh
sed -i "s/$ws/$ws2/g" /etc/stunnel5/stunnel5.conf
sed -i "s/   - Websocket TLS           : $ws/   - Websocket TLS           : $ws2/g" /root/log-install.txt

iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $ws -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $ws -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $ws2 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $ws2 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null


sed -i "s/$ws/$ws2/g" /etc/systemd/system/ws-tls.service
systemctl daemon-reload
systemctl restart sslh
systemctl restart ws-tls > /dev/null

#ganti port info

echo -e "\e[032;1mPort $ws2 modified successfully\e[0m"
else
echo "Port $ws2 is used"
fi



#done 
