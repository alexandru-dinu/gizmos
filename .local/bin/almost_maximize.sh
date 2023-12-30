#!/usr/bin/env bash

set -euo pipefail

# TODO: read from xrandr
MAX_W=2560
MAX_H=1440

wid=$(xdotool getactivewindow)

dx=70
dy=90
xdotool windowmove $wid $dx $dy

w=$(( $MAX_W - 2 * $dx ))
h=$(( $MAX_H - 2 * $dy ))
xdotool windowsize $wid $w $h
