#!/bin/bash -e

echo "Do nothing."

# This is just here to sync up with the other desktops systems.
# It just makes life easier when doing a 'git diff' between branches.
# But if we were to do the same thing, it would be roughly this ...

#source /etc/profile
#env-update
#emerge -b1q binutils
#emerge -b1q gcc
#emerge -b1q glibc
