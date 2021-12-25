#!/bin/bash

# Example locker script -- demonstrates how to use the --transfer-sleep-lock
# option with i3lock's forking mode to delay sleep until the screen is locked.

## CONFIGURATION ##############################################################

# Options to pass to i3lock
B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#ff00ffcc'  # default
T='#ee00eeee'  # text
W='#880000bb'  # wrong
V='#bb00bbbb'  # verifying
i3lock_options="\
    --insidevercolor=$C   \
    --ringvercolor=$V     \
    \
    --insidewrongcolor=$C \
    --ringwrongcolor=$W   \
    \
    --insidecolor=$B      \
    --ringcolor=$D        \
    --linecolor=$B        \
    --separatorcolor=$D   \
    \
    --verifcolor=$T        \
    --wrongcolor=$T        \
    --timecolor=$T        \
    --datecolor=$T        \
    --layoutcolor=$T      \
    --keyhlcolor=$W       \
    --bshlcolor=$W        \
    \
    --screen 1            \
    --blur 10              \
    --clock               \
    --indicator           \
    --timestr='%H:%M:%S'  \
    --datestr='%A, %m %Y' \
    --keylayout 2         "


# Run before starting the locker
pre_lock() {
    #mpc pause
    xbacklight -get > /tmp/xblsavesleep
    xbacklight -set 5
    return
}

# Run after the locker exits
post_lock() {
    xbacklight -set `cat /tmp/xblsavesleep`
    return
}

###############################################################################

pre_lock

# We set a trap to kill the locker if we get killed, then start the locker and
# wait for it to exit. The waiting is not that straightforward when the locker
# forks, so we use this polling only if we have a sleep lock to deal with.
if [[ -e /dev/fd/${XSS_SLEEP_LOCK_FD:--1} ]]; then
    kill_i3lock() {
        pkill -xu $EUID "$@" i3lock
    }

    trap kill_i3lock TERM INT

    # we have to make sure the locker does not inherit a copy of the lock fd
    i3lock $i3lock_options {XSS_SLEEP_LOCK_FD}<&-

    # now close our fd (only remaining copy) to indicate we're ready to sleep
    exec {XSS_SLEEP_LOCK_FD}<&-

    while kill_i3lock -0; do
        sleep 0.5
    done
else
    trap 'kill %%' TERM INT
    i3lock -n $i3lock_options &
    wait
fi

post_lock
