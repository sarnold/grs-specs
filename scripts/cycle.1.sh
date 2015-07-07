#!/bin/bash -e

source /etc/profile
env-update
USE="build" emerge -bkNu1q sys-apps/portage
ACCEPT_KEYWORDS="**" emerge -b1q =app-portage/grs-9999
