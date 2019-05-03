#!/usr/bin/env bash
set -exo pipefail

export KEYBASE_RUN_MODE=prod
export HOME=/home/keybase

# Prepare the home dirs / volumes
mkdir -p /home/keybase
chown -R keybase /home/keybase

if [ -z "$KEYBASE_DEVICENAME" ]; then
    export KEYBASE_DEVICENAME="$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 13 ; echo '')"
    echo "Device name not found, using $KEYBASE_DEVICENAME"
fi

# Run keybase login, expecting autoprovisioning 
sudo -E -u keybase keybase --standalone --debug login -paperkey "$KEYBASE_PAPERKEY" -devicename "$KEYBASE_DEVIECNAME" $KEYBASE_USERNAME

# Then switch to service
exec sudo -E -u keybase $@
