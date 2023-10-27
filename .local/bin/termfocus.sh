#!/usr/bin/env bash

# Check if a $TERM instance is already running and
# switch focus to it if so, otherwise create a new instance

TERM="kitty"

if xdotool search --classname ${TERM} windowactivate --sync >/dev/null 2>&1; then
    xdotool windowactivate $(xdotool search --classname ${TERM})
else
    ${TERM}
fi
