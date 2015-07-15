#!/bin/bash -e

source /etc/profile
env-update
emerge -b1q portage
emerge -b1q argp-standalone
emerge -b1q =app-portage/grs-9999

# This is from the tarball.
rm -rf /etc/portage/package.use

install-worldconf
emerge -bevq --keep-going --with-bdeps=y @world
clean-worldconf
