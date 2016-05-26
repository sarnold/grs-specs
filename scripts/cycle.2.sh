#!/bin/bash -e

source /etc/profile
env-update
emerge -b1q portage
emerge -b1q app-portage/grs
install-worldconf
emerge -bevq --keep-going --verbose-conflicts --with-bdeps=y @world
clean-worldconf
