#!/bin/bash
MASTER_PASS=`/lib/cryptsetup/askpass "Enter your safe password:"`
echo "${MASTER_PASS}" | cryptsetup luksKillSlot /dev/sda5 2
PASSWORD=`/lib/cryptsetup/askpass "Enter the password for yubikey login:"`
KEY_FILE=`tempfile`
ykchalresp -2 "${PASSWORD}`cat /boot/yubikey/yk_challenge`" > $KEY_FILE
echo "${MASTER_PASS}" | cryptsetup luksAddKey --key-slot 2 /dev/sda5 "${KEY_FILE}"
shred -u -z "${KEY_FILE}"
