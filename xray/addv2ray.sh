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
source /var/lib/geovpnstore/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
read -rp "Bug: " -e bug
tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
nontls="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/v2ray-tls.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
exp=`date -d "$masaaktif days" +"%d-%m-%Y"`
created=`date -d "0 days" +"%d-%m-%Y"`
sed -i '/#xray-v2ray-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/v2ray-tls.json
sed -i '/#xray-v2ray-nontls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/v2ray-nontls.json
cat>/etc/xray/v2ray-$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/sal",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF
cat>/etc/xray/v2ray-$user-nontls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${bug}",
      "port": "${nontls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/sal",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
xrayv2ray1="vmess://$(base64 -w 0 /etc/xray/v2ray-$user-tls.json)"
xrayv2ray2="vmess://$(base64 -w 0 /etc/xray/v2ray-$user-nontls.json)"
systemctl restart xray@v2ray-tls
systemctl restart xray@v2ray-nontls
service cron restart
clear
echo -e "==================================${off}"
echo -e "      XRAY / VMESS${off}"
echo -e "==================================${off}"
echo -e " Remarks        : ${user}"
echo -e " Bug            : ${bug}"
echo -e " Domain         : ${domain}"
echo -e " Port TLS       : ${tls}"
echo -e " Port No TLS    : ${nontls}"
echo -e " ID             : ${uuid}"
echo -e " AlterID        : 0"
echo -e " Security       : auto"
echo -e " Network        : ws"
echo -e " Path           : /sal${off}"
echo -e "==================================${off}"
echo -e " VMESS TLS : $off${xrayv2ray1}"
echo -e "==================================${off}"
echo -e " VMESS NON-TLS : $off${xrayv2ray2}"
echo -e "==================================${off}"
echo -e " Aktif Selama   : $masaaktif Hari"
echo -e " Dibuat Pada    : $tnggl"
echo -e " Berakhir Pada  : $expe${off}"
echo -e "==================================${off}"
echo -e ""
echo -e " Script By SallVPN"
echo -e ""
echo -e ""
echo -e ""
read -n 1 -s -r -p "Press Any Key To Back On Menu"

menu-v2ray

