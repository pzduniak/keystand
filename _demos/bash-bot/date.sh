#!/usr/bin/env bash

while true; do
    MSG="sending at $(date)"
    keybase chat send $CHAT_TARGET "$MSG"
    sleep 1h
done
