#!/bin/bash
PASSWORD=`/lib/cryptsetup/askpass "Insert your yubikey and enter your password:"`
ykchalresp -2 "${PASSWORD}`cat /boot/yubikey/yk_challenge`" | cryptsetup -T 1 open --type luks --test-passphrase --key-file=- /dev/sda5
if [ $? -ne 0 ] ; then
	echo "Password test failed."
else
	echo "Password test succeeded."
fi
