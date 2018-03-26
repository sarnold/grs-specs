#!/bin/bash

source /etc/profile
env-update
export uname_r="4.14.20-armv7-x4"

install-worldconf
layman -S

emerge --nodeps -1n armv7multi-sources:4.14.20-r4

# workaround for musl and ld.so
touch /etc/ld.so.cache
mkdir -p /etc/ld.so.conf.d

# slight workaround for genkernel
ebuild /usr/portage/sys-apps/busybox/busybox-1.28.0.ebuild fetch

DEFAULT_KERNEL_CONFIG="/etc/kernels/kernel-config-arm-4.14.20-armv7-x4" \
  genkernel kernel

# post-genkernel arm workaround
make -C /usr/src/linux dtbs_install
ln -sf kernel-genkernel-arm-${uname_r} /boot/vmlinuz-${uname_r}

clean-worldconf
