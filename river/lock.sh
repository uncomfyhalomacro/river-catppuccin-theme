#!/bin/sh 

pkill swayidle
sleep 1s 

exec swayidle -w \
          timeout 600 'brightnessctl set 30%' \
          timeout 120 'swaylock -f -c 00000000' \
            resume 'brightnessctl set 80%' \
          before-sleep "swaylock -f -c 00000000" & disown
