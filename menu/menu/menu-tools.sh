#!/bin/bash
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'
yl='\e[32;1m'
bl='\e[36;1m'
gl='\e[32;1m'
rd='\e[31;1m'
mg='\e[0;95m'
blu='\e[34m'
op='\e[35m'
or='\033[1;33m'
bd='\e[1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
# Getting
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

x="ok"
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
chck_pid(){
	PID=`ps -ef |grep -v grep | grep accel-ppp |awk '{print $2}'`
	if [[ ! -z "${PID}" ]]; then
			echo -e "Current status: ${Green_font_prefix} Installed${Font_color_suffix} & ${Green_font_prefix}Running${Font_color_suffix}"
		else
			echo -e "Current status: ${Green_font_prefix} Installed${Font_color_suffix} but ${Red_font_prefix}Not Running${Font_color_suffix}"
		fi
}
while true $x != "ok"
do

echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m                 ⇱ TOOLS MENU ⇲                   \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "
[${GREEN}01${NC}] ${color1} •${color3}$bd Change Port All Account
[${GREEN}02${NC}] ${color1} •${color3}$bd Webmin Menu
[${GREEN}03${NC}] ${color1} •${color3}$bd Limit Bandwith Speed Server
[${GREEN}04${NC}] ${color1} •${color3}$bd Check Usage of VPS Ram
[${GREEN}05${NC}] ${color1} •${color3}$bd Reboot VPS
[${GREEN}06${NC}] ${color1} •${color3}$bd Speedtest VPS
[${GREEN}07${NC}] ${color1} •${color3}$bd Information Display Syste
[${GREEN}08${NC}] ${color1} •${color3}$bd Info Script Auto Install
[${GREEN}09${NC}] ${color1} •${color3}$bd Clear Log
[${GREEN}10${NC}] ${color1} •${color3}$bd Auto Reboot 
[${GREEN}11${NC}] ${color1} •${color3}$bd Service Status
[${GREEN}12${NC}] ${color1} •${color3}$bd Cek Bandwidth VPS
[${GREEN}13${NC}] ${color1} •${color3}$bd Install BBR
[${GREEN}14${NC}] ${color1} •${color3}$bd Change Banner SSH
[${GREEN}15${NC}] ${color1} •${color3}$bd Ganti Password VPS
[${GREEN}16${NC}] ${color1} •${color3}$bd Domain Section

[00] • Back to Main Menu \033[1;32m<\033[1;33m<\033[1;31m<\033[1;31m"
echo ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo ""
echo -ne "Select menu : "; read x

case "$x" in 
   1 | 01)
   clear
   changeport
   break
   ;;
   2 | 02)
   clear
   wbmn
   break
   ;;
   3 | 03)
   clear
   limitspeed
   break
   ;;
   4 | 04)
   clear
   ram
   break
   ;;
   5 | 05)
   clear
   reboot
   break
   ;;
   6 | 06)
   clear
   speedtest -s 7556
   break
   ;;
   7 | 07)
   clear
   info
   break
   ;;
   8 | 08)
   clear
   about
   break
   ;;
   9 | 09)
   clear
   clearlog
   break
   ;;
   10 | 10)
   clear
   autoreboot
   break
   ;;
   11 | 11)
   clear
   running
   break
   ;;
   12 | 12)
   clear
   bw
   break
   ;;
   13 | 13)
   clear
   bbr
   break
      ;;
   14 | 14)
   clear
   nano /etc/issue.net
   break
   ;;
   15 | 15)
   clear
   sudo passwd && sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config && sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config && sudo systemctl restart sshd
   break
   ;;
   16 | 16)
   clear
   menu-domain
   break
   ;;
   0 | 00)
   clear
   menu
   break
   ;;
   *)
   clear
esac
done
#fim
