#!/bin/bash -e

# This comes from the stage3.
rm -f /etc/portage/package.use/uclibc

source /etc/profile
env-update
emerge -b1q binutils
emerge -b1q gcc
emerge -b1q uclibc
emerge -b1q argp-standalone
emerge -b1q layman
layman -L
layman -a blueness
