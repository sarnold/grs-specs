#!/bin/bash -e

source /etc/profile
env-update
install-worldconf
emerge -buvNDq --keep-going --with-bdeps=y @world
clean-worldconf
emerge -bq --keep-going @preserved-rebuild
emerge --depclean
