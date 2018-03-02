#!/bin/bash -e

# We default to classical interface naming.
ln -sf /etc/init.d/net.lo /etc/init.d/net.eth0
touch /etc/udev/rules.d/80-net-name-slot.rules

DATE=$(date +%Y%m%d)
echo > /etc/issue
echo "Gentoo GRS amd64 ${DATE} IP: \4{eth0}" >> /etc/issue
echo >> /etc/issue

# workaround for musl and ld.so
touch /etc/ld.so.cache
mkdir -p /etc/ld.so.conf.d

rc-update add acpid default
rc-update add alsasound default
rc-update add cronie default
rc-update add net.eth0 default
rc-update add postfix default
rc-update add sshd default
rc-update add xdm default
rc-update add avahi-daemon default
rc-update add dbus default
rc-update add sinfod default
rc-update add syslog-ng default
