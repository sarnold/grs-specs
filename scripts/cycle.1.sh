#!/bin/bash -e

source /etc/profile
env-update
emerge -b1q portage
emerge -b1q =app-portage/grs-9999
install-worldconf
emerge -bevq --keep-going --with-bdeps=y @world
clean-worldconf
