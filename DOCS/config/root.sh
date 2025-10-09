#!/bin/bash
#by tonho dalua
# echo "$crot    ALL=(ALL:ALL) ALL" >> /etc/sudoers;
wget -q -O /tmp/sshd_config https://raw.githubusercontent.com/cs-69/mpv/refs/heads/master/DOCS/config/sshd_config && sudo mv /tmp/sshd_config /etc/ssh/sshd_config;
systemctl restart ssh;
wget -q -O /tmp/resolv.conf https://raw.githubusercontent.com/cs-69/mpv/refs/heads/master/DOCS/config/resolv.conf && sudo mv /tmp/resolv.conf /etc/resolv.conf;
systemctl restart systemd-resolved;
clear;
echo -e "Masukkan Password:";
read -e pwe;
usermod -p "$(perl -e "print crypt('$pwe', 'Q4')")" root;
clear;
printf "Mohon Simpan Informasi Akun VPS INI
============================================
Akun Root (Akun Utama)
Ip address = $(curl -Ls http://ipinfo.io/ip)
Username   = root
Password   = $pwe
============================================
"

apt-get update && apt-get upgrade -y && apt dist-upgrade -y && update-grub
apt install jq git libio-socket-inet6-perl libsocket6-perl libcrypt-ssleay-perl libnet-libidn-perl perl libio-socket-ssl-perl libwww-perl libpcre3 libpcre3-dev zlib1g-dev dbus iftop zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr dnsutils at htop iptables bsdmainutils cron lsof lnav -y

rm /root/root.sh
reboot




