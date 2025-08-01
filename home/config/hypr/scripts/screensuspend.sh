#!/usr/bin/env bash

mkdir -p /tmp/lockscreen/
rm -rf /tmp/lockscreen/*
hyprshot -f 1.png -o /tmp/lockscreen -m window -m active
systemctl suspend && hyprlock
