# Getting
clear
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
PERMISSION

if [ "$res" = "Expired" ]; then
Exp="\033[1;31mExpired\033[0m"
rm -f /home/needupdate > /dev/null 2>&1
else
Exp=$(curl -sS https://raw.githubusercontent.com/sallxd/perizinan/main/main/allow | grep $MYIP | awk '{print $3}')
fi
chck_b(){
	PID=`ps -ef |grep -v grep | grep scvps_bot |awk '{print $2}'`
	if [[ ! -z "${PID}" ]]; then
			sts="\033[0;32m◉ \033[0m"
		else
			sts="\033[1;31m○ \033[0m"
    fi
}
echo -e ""
#toilet --gay -f slant -t " Geo Project"
#cat /usr/bin/bannerku | lolcat
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
IPVPS=$(curl -s ipinfo.io/ip )
DOMAIN=$(cat /etc/xray/domain)
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
jam=$(date +"%T")
hari=$(date +"%A")
tnggl=$(date +"%d-%B-%Y")
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')
 echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
 echo -e "\E[44;1;39m                     ⇱ INFORMASI VPS ⇲                        \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${color1} •${color3}$bd ISP Name          ${color1} :${color3}$bd $ISP"
 echo -e " ${color1} •${color3}$bd City              ${color1} :${color3}$bd $CITY"
 echo -e " ${color1} •${color3}$bd CPU Model         ${color1} :${color3}$bd$cname"
 echo -e " ${color1} •${color3}$bd Number Of Cores   ${color1} :${color3}$bd $cores"
 echo -e " ${color1} •${color3}$bd CPU Frequency     ${color1} :${color3}$bd$freq MHz"
 echo -e " ${color1} •${color3}$bd Total RAM         ${color1} :${color3}$bd $tram MB"
 echo -e " ${color1} •${color3}$bd Waktu             ${color1} :${color3}$bd $jam"
 echo -e " ${color1} •${color3}$bd Hari              ${color1} :${color3}$bd $hari"
 echo -e " ${color1} •${color3}$bd Tanggal           ${color1} :${color3}$bd $tnggl"
 echo -e " ${color1} •${color3}$bd IP VPS            ${color1} :${color3}$bd $IPVPS"
 echo -e " ${color1} •${color3}$bd Domain            ${color1} :${color3}$bd $DOMAIN"
 echo -e " ${color1} •${color3}$bd Client Name       ${color1} :${color3}$bd $Name"
 echo -e " ${color1} •${color3}$bd Expiry script     ${color1} :${color3}$bd $Exp"
 echo -e " ${color1} •${color3}$bd Version           ${color1} :${color3}$bd Latest Version"
 echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
 echo -e "\E[44;1;39m                     ⇱ MENU  OPTIONS ⇲                        \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "
[\033[0;32m01\033[0m] • SSH & OpenVPN Section
[\033[0;32m02\033[0m] • SSTP - L2TP - PPTP - Wireguard Section
[\033[0;32m03\033[0m] • Shadowsocks & ShadowsocksR Section
[\033[0;32m04\033[0m] • V2ray Vmess & Vless Section
[\033[0;32m05\033[0m] • Trojan & TrojanGO Section
[\033[0;32m06\033[0m] • Backup Section
[\033[0;32m07\033[0m] • Trial Account Section
[\033[0;32m08\033[0m] • System Tools Section

[00] • Back to exit Menu \033[1;32m<\033[1;33m<\033[1;31m<\033[1;31m"
echo ""
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo -ne "Select menu : "; read x

case "$x" in 
   1 | 01)
   clear
   menu-ssh
   break
   ;;
   2 | 02)
   clear
   menu-vpn
   break
   ;;
   3 | 03)
   clear
   menu-shadowsocks
   break
   ;;
   4 | 04)
   clear
   menu-v2ray
   break
   ;;
   5 | 05)
   clear
   menu-trojan
   break
   ;;
   6 | 06)
   clear
   menu-backup
   break
   ;;
   7 | 07)
   clear
   menu-trial
   break
   ;;
   8 | 08)
   clear
   menu-tools
   break
   ;;
   0 | 00)
   clear
   exit
   ;;
   *)
   menu
esac

#fim
