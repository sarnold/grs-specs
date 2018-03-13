#!/bin/bash -e

source /etc/profile
env-update
emerge -b1q portage
ACCEPT_KEYWORDS="~arm" emerge -b1q argp-standalone
ACCEPT_KEYWORDS="~arm" emerge -b1q app-portage/grs

install-worldconf

emerge -b1q binutils
binutils-config 2
emerge -qC binutils:2.28.1

emerge -b1q gcc
gcc-config 2
emerge -qC gcc:5.4.0

emerge -b1q musl

emerge -bevq --keep-going --verbose-conflicts --with-bdeps=y @world

clean-worldconf
