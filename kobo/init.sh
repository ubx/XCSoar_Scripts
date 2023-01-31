#!/bin/sh

### turn off front LED
echo 0 > /sys/class/leds/GLED/brightness

### Note: the file below must NOT resist in scrips directory. Otherwise, we are not
###       able to Export USB storage!!
file=/usr/set_brightness.sh
if test -f "file"; then
    $file &
fi

