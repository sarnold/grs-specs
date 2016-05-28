#!/bin/bash -e

source /etc/profile
env-update

# This comes from the stage3, but we might
# be building a different version of uclibc.
rm -f /etc/portage/package.use/uclibc
rm -f /etc/portage/savedconfig/sys-libs/uclibc
emerge -b1q uclibc

emerge -b1q binutils
emerge -b1q gcc
emerge -b1q uclibc
emerge -b1q argp-standalone
