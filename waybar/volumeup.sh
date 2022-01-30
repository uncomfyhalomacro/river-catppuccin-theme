#!/bin/sh
pamixer -ui 1 
exec pamixer --get-volume > /run/user/1000/wobvolume.sock
