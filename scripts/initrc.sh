#!/bin/bash -e

ln -sf /etc/init.d/net.lo /etc/init.d/net.eth0
rc-update add alsasound default
rc-update add cupsd default
rc-update add fcron default
rc-update add net.eth0 default
rc-update add postfix default
rc-update add sshd default
rc-update add xdm default
rc-update add avahi-daemon default
rc-update add dbus default
rc-update add samba default
rc-update add syslog-ng default
