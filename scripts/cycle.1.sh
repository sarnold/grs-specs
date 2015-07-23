#!/bin/bash -e

source /etc/profile
env-update
emerge -b1q layman
layman -L
layman -a musl
