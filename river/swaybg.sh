#!/usr/bin/env bash

killall -q wbg
while pgrep -x wbg >/dev/null; do sleep 1; done
exec wbg $HOME/.config/river/background.png & 
