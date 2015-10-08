#!/bin/bash -e

source /etc/profile
env-update
emerge -b1q portage
emerge -b1q app-cdr/cdrkit
emerge -b1q virtual/cdrtools
emerge -b1q app-portage/grs
install-worldconf
emerge -bevq --keep-going --with-bdeps=y @world
clean-worldconf
