#!/bin/sh

device='/dev/input/event3'

key_f23='*EV_KEY KEY_F23 0x00000001*'
key_f24='*EV_KEY KEY_F24 0x00000001*'

get_br() { value=$(cat /sys/class/backlight/mxc_msp430.0/brightness); }
set_br() { echo "$1" >/sys/class/backlight/mxc_msp430.0/brightness; }

evdev-dump "$device" | while read line; do
  case $line in
  $key_f23)
    get_br
    if [ $value -lt 100 ]; then
      set_br $((value + 10))
    fi
    ;;
  $key_f24)
    get_br
    if [ $value -ge 10 ]; then
      set_br $((value - 10))
    fi
    ;;
  esac
done
