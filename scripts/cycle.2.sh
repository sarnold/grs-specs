#!/bin/bash -e

source /etc/profile
env-update

emerge -b1q portage
ACCEPT_KEYWORDS="~arm" emerge -b1q argp-standalone
ACCEPT_KEYWORDS="**" emerge -b1q app-portage/grs

install-worldconf

emerge -b1q binutils
emerge -b1q gcc
emerge -b1q musl

emerge -bevq --keep-going --verbose-conflicts --with-bdeps=y @world

clean-worldconf
