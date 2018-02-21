#!/bin/bash

source /etc/profile
env-update

#install-worldconf
#layman -S
#emerge -buvNDq --keep-going --verbose-conflicts --with-bdeps=y @world
#clean-worldconf

emerge --depclean
emerge @preserved-rebuild
