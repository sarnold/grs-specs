#!/bin/bash -e

source /etc/profile
env-update

# This is a workaround for now to avoid a problem
# with dev-python/cryptography which depends on
# >=dev-libs/openssl-1.0.2:0=[-bindist(-)]
USE=-bindist emerge -1q --nodeps openssl openssh
emerge -b1q layman
layman -L

# Don't return exit 1 if we fail since
# we may have already added the overlay
layman -a musl || true
layman -S
