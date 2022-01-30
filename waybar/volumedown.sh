#!/bin/sh 
pamixer -ud 1 
exec pamixer --get-volume > /run/user/1000/wobvolume.sock
