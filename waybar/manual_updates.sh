#!/bin/sh

foot sh -c 'tmux new -s updates "sudo zypper --verbose dup -y; flatpak --user update -y; pkill -SIGRTMIN+8 waybar"'
