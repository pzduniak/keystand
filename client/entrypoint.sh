#!/usr/bin/env bash
set -exo pipefail

export KEYBASE_RUN_MODE=prod
export HOME=/home/keybase

exec sudo -E -u keybase keybase $@
