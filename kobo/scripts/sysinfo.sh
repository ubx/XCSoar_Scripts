#!/bin/sh

log="/mnt/onboard/XCSoarData/kobo/scripts/sysinfo.log"

echo "Start...." > $log
lsmod >> $log
ps >> $log
ifconfig >> $log
dmesg >> $log
echo "....End" >> $log
