#!/bin/sh

device='/dev/input/event3'

key_f23='*EV_KEY KEY_F23 0x00000001*'
key_f24='*EV_KEY KEY_F24 0x00000001*'

evdev-dump "$device" | while read line; do
  case $line in
  $key_f23)
    value=$(cat /sys/class/backlight/mxc_msp430.0/brightness)
    if [ $value -lt 100 ]; then
      value=$((value + 10))
      echo $value >/sys/class/backlight/mxc_msp430.0/brightness
    fi
    ;;
  $key_f24)
    value=$(cat /sys/class/backlight/mxc_msp430.0/brightness)
    if [ $value -ge 10 ]; then
      value=$((value - 10))
      echo $value >/sys/class/backlight/mxc_msp430.0/brightness
    fi
    ;;
  esac
done
