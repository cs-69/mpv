#!/bin/bash
#by tonho dalua
# echo "$crot    ALL=(ALL:ALL) ALL" >> /etc/sudoers;
rm /etc/ssh/sshd_config;
wget -q -O /etc/ssh/sshd_config https://raw.githubusercontent.com/cs-69/mpv/refs/heads/master/DOCS/config/sshd_config;
systemctl restart ssh;
rm /etc/resolv.conf;
wget -q -O /etc/resolv.conf https://raw.githubusercontent.com/cs-69/mpv/refs/heads/master/DOCS/config/resolv.conf;
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
apt-get update -y
apt-get update && apt-get upgrade -y && apt dist-upgrade -y && update-grub

rm /root/root.sh
reboot