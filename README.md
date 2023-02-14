# XCSoar scripts for Kobo Libra 2 and Clara 2E
Scripts for the Tools Menu for the Libra 2 and Clara 2E (and may be for other Kobo with Bluetooth).

Copy the directory ``kobo`` to the Kobo directory ``/mnt/onboard/XCSoarData/`` 

## ``kobo/scripts/``
Contains scripts for Bluetooth connection, USB Serial connection and debugging aids.

### ``kobo/scripts/sub/``
Contains subprogram used by the scrips in the parent directory. Also, a way to 'hide' in the Tools Menu.

### ``kobo/scripts/init.sh``
Called by Kobo Menu launch. Here used to turn off the Kobo front (blinking) LED. And to start ``usr/set_brightness.sh``
if it exists (see below).

## ``usr/set_brightness.sh``
For Kobo Libra 2. With the 2 buttons Up and Down, you can increase or decrease the screen brightness.