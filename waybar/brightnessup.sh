#!/bin/sh 
exec brightnessctl s +1% | sed -En 's/.*\(([0-9]+)%\).*/\1/p' > /run/user/1000/wobbacklight.sock
