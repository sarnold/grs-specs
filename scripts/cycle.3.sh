#!/bin/bash

source /etc/profile
env-update
install-worldconf
layman -S
emerge -buvNDq --keep-going --with-bdeps=y @world
clean-worldconf
emerge -bq --keep-going @preserved-rebuild
emerge --depclean
