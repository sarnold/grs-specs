#!/bin/bash

source /etc/profile
env-update

install-worldconf
layman -S

emerge --nodeps -1n armv7multi-sources:4.14.20-r4

# workaround for musl and ld.so
touch /etc/ld.so.cache
mkdir -p /etc/ld.so.conf.d

# slight workaround for genkernel
ebuild /usr/portage/sys-apps/busybox/busybox-1.28.0.ebuild fetch

genkernel kernel

# post-genkernel arm workaround
make -C /usr/src/linux dtbs_install
ln -sf /boot/kernel-genkernel-arm-4.14.20-armv7-x4 /boot/vmlinuz-4.14.20-armv7-x4

clean-worldconf
