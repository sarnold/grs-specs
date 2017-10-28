#!/bin/bash

source /etc/profile
env-update
install-worldconf
emerge -buvNDq --keep-going --verbose-conflicts --with-bdeps=y @world
clean-worldconf
emerge --depclean
emerge -bq --keep-going @preserved-rebuild
