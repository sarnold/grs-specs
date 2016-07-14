#!/bin/bash -e

source /etc/profile
env-update

emerge -b1q binutils
emerge -b1q gcc
emerge -b1q uclibc-ng
emerge -b1q argp-standalone
