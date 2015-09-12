#!/bin/bash -e

source /etc/profile
env-update
install-worldconf
emerge -uvNDq --keep-going --with-bdeps=y @world
clean-worldconf
emerge --unmerge app-portage/grs
emerge -q @preserved-rebuild
emerge --depclean
