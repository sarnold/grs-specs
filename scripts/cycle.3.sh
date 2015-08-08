#!/bin/bash -e

source /etc/profile
env-update
install-worldconf
emerge -buvNDq --keep-going --with-bdeps=y @world
clean-worldconf
emerge -bq @preserved-rebuild
emerge --deplcean
