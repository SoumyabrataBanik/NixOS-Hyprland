#!/usr/bin/env bash

if pgrep -x "waybar"; then
    pkill waybar
else
    waybar &
fi
