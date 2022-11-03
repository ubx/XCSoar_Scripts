#!/bin/sh

for i in /var/run/dbus /var/lib/dbus; do
        mkdir -p $i
done

/bin/dbus-uuidgen > /var/lib/dbus/machine-id
/bin/dbus-daemon --system &

insmod /drivers/mx6sll-ntx/wifi/sdio_bt_pwr.ko
/sbin/rtk_hciattach -n -s 115200 ttymxc1 rtk_h5 &
hciconfig hci0 up

sleep 3

/libexec/bluetooth/bluetoothd &

sleep 3

bluetoothctl power on

sleep 3

bluetoothctl connect $1

sleep 3

rfcomm bind 0 $1 ${2:-1}
