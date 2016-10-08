#!/bin/sh
chmod +x *
cp ./yubikey /usr/share/initramfs-tools/hooks/yubikey
cp ./yubikey_unlock /lib/cryptsetup/scripts/yubikey_unlock
cp ./yubico_refresh /usr/share/initramfs-tools/scripts/local-bottom/yubico_refresh
