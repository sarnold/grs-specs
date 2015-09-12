#!/bin/bash -e

# Set the root password to 'root'
echo root:root | chpasswd

# Create a user 'thuser' and set
# the password to 'thuser'
useradd -m thuser
echo thuser:thuser | chpasswd

# Make user 'thuser' a power user
gpasswd -a thuser disk
gpasswd -a thuser wheel
gpasswd -a thuser audio
gpasswd -a thuser video
gpasswd -a thuser floppy
gpasswd -a thuser tape
gpasswd -a thuser cdrom
gpasswd -a thuser cdrw
gpasswd -a thuser usb

gpasswd -a portage wheel

# For the grsec groups.  Make sure these
# match whats in kernel-cofig!
groupadd -g 9995 graudit
groupadd -g 9996 grslink
groupadd -g 9997 grasock
groupadd -g 9998 grcsock
groupadd -g 9999 grssock
