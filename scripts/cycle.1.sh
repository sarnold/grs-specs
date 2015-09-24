#!/bin/bash -e

source /etc/profile
env-update
emerge -1q portage
USE=bindist emerge -1q app-portage/grs
emerge --unmerge sys-fs/udev
emerge -1q sys-fs/eudev
install-worldconf
emerge -evq --keep-going --with-bdeps=y @world
clean-worldconf
