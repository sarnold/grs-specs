#!/bin/bash -e

source /etc/profile
env-update
install-worldconf
emerge -bevq --keep-going --with-bdeps=y @world
clean-worldconf
