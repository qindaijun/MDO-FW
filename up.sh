#!/bin/bash
sudo mount -o remount,rw /
#Install Required Software
wget https://github.com/qindaijun/MDO-FW/raw/master/UHF2018-2-25.hex
# DV-Mega Mods
sudo systemctl stop mmdvmhost.timer
sudo systemctl stop mmdvmhost.service
sudo stm32flash -v -w UHF2018-2-25.hex -g 0x0 -R -i 23,-22,22:-23,22 /dev/ttyAMA0 
sudo systemctl start mmdvmhost.timer
sudo systemctl restart mmdvmhost.service
sudo rm UHF2018-2-25.hex
sudo rm up.sh
sudo mount -o remount,ro /
