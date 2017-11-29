#!/bin/bash

Black='\033[1;30m'
Red='\033[1;31m'
Green='\033[1;32m'
Yellow='\033[1;33m'
Blue='\033[1;34m'
Purple='\033[1;35m'
Cyan='\033[1;36m'
White='\033[1;37m'

sslscan='/usr/bin/sslscan'
sslyze='/usr/bin/sslyze'
pip='/usr/bin/pip'
python='/usr/bin/python'
git='/usr/bin/git'

if [ $(id -u) != 0 ]
then
	echo
	echo
	echo -e "${Red} ARE U DRUNK? Execute as root!!"
	echo
	echo
	exit
else
	echo
fi
sleep 0.4
echo -e "${Red}Greetz: V4p0r, D3z3n0v3, B33ck, Adolfinho, Bacon, all friends.."
sleep 0.4
echo -e "${Red}---------------------------------------------------------"
sleep 0.4
echo -e "${Red}SSLMassscanner - By: Biscoitao"
sleep 3.5
mkdir masslscan
echo "Site you want to attack ( www.example.com ) :"
read TARGET
echo
sleep 10 &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  printf "\b${sp:i++%${#sp}:1}"
done
echo
echo
if [ -e $sslscan ]
then
    sudo sslscan $TARGET
else
    echo -e "${Red}SSLScan -- > Not Found, installing to you" && sudo apt-get install sslscan -y
    sudo sslscan $TARGET
fi
sleep 6
if [ -e $sslyze ]
then
    sudo sslyze --resum --compression --reneg --sslv2 --sslv3 --hide_rejected_ciphers $TARGET
else
    echo -e "${Red}SSLyze -- > Not found, installing to you" && sudo apt-get install sslyze -y
    sudo sslyze --resum --compression --reneg --sslv2 --sslv3 --hide_rejected_ciphers $TARGET
fi
sleep 6
if [ -e $pip ]
then
    sudo apt-get install python-pip -y
else
    echo ''
fi
sleep 6
if [ -e $git ]
then
    sudo apt-get install git -y
else
    echo ''
fi
sleep 6
if [ -e $python ]
then
    sudo apt-get install python
else
    echo ''
fi
sleep 6
cd masslscan
sudo git clone https://github.com/hahwul/a2sv.git
cd a2sv
sudo pip install argparse
sudo pip install netaddr
sudo apt-get install openssl
sudo python a2sv.py -t $TARGET
