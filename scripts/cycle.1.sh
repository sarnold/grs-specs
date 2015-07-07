#!/bin/bash -e

source /etc/profile
env-update
USE="build" emerge -bkNu1q sys-apps/portage
emerge -bkNu1q =app-portage/grs-9999
