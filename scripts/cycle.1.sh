#!/bin/bash -e

source /etc/profile
env-update
emerge -b1q layman
layman -L
layman -a musl
emerge -b1q binutils
emerge -b1q gcc
emerge -b1q musl
