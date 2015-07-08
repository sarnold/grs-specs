#!/bin/bash -e

for d in /tmp /var/tmp /var/log; do
    find ${d} -mindepth 1 -exec rm -rf {} +
rm -rf /etc/resolv.conf
