#!/bin/bash -e

source /etc/profile
env-update
emerge -b1q portage
emerge -b1q app-portage/grs
emerge --unmerge sys-fs/udev
emerge -b1q sys-fs/eudev
install-worldconf
emerge -bevq --keep-going --with-bdeps=y @world
clean-worldconf
