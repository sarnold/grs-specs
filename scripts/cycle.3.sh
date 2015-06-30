#!/bin/bash -e

source /etc/profile
env-update
eselect python set python3.3
install-worldconf
emerge -buvNDq --keep-going --with-bdeps=y @world
clean-worldconf
emerge -bq @preserved-rebuild
