#!/bin/bash -e

source /etc/profile
env-update
emerge -b1q =app-portage/grs-9999
eselect python set python3.3
install-worldconf
emerge -bevq --keep-going --with-bdeps=y @world
clean-worldconf
