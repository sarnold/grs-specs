#!/bin/bash

source /etc/profile
env-update

install-worldconf
layman -S

emerge --nodeps -1n armv7multi-sources:4.14.6-r2

genkernel kernel

clean-worldconf
