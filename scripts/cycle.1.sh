#!/bin/bash -e

source /etc/profile
env-update
emerge -b1q layman
layman -L

# Don't return exit 1 if we fail since
# we may have already added the overlay
layman -a musl || true
layman -S
