#!/bin/sh

for i in /var/run/dbus /var/lib/dbus; do
        mkdir -p $i
done

/bin/dbus-uuidgen > /var/lib/dbus/machine-id
/bin/dbus-daemon --system &

insmod /drivers/mx6sll-ntx/wifi/sdio_bt_pwr.ko

model=`dd if=/dev/mmcblk0 bs=8 count=1 skip=64`
if [ `expr substr $model 1 7` = SN-N418 ] ; then # Libra 2
   /sbin/rtk_hciattach -n -s 115200 ttymxc1 rtk_h5 &
elif [ `expr substr $model 1 7` = SN-N506 ] ; then # Clara 2E
   insmod /drivers/mx6sll-ntx/wifi/mlan.ko
   insmod /drivers/mx6sll-ntx/wifi/moal.ko mod_para=nxp/wifi_mod_para_sd8987.conf
   insmod /drivers/mx6sll-ntx/wifi/sdio_wifi_pwr.ko
   /sbin/hciattach -n ttymxc1 any 1500000 flow -t 20 &
fi

hciconfig hci0 up

sleep 3

/libexec/bluetooth/bluetoothd &

sleep 3

bluetoothctl power on

sleep 3

bluetoothctl connect $1

sleep 3

rfcomm bind 0 $1 ${2:-1}