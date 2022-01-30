#!/bin/sh

UPDATES="$(($(zypper lu | tail -n +5 | wc -l) + $(flatpak remote-ls --updates | tail -n +1 | wc -l)))"
echo "$UPDATES"
if [[ ${UPDATES} != "0" ]]
then
	notify-send -a "openSUSE TumbleWeed Updates" "Total number of packages to update" "$UPDATES"
else
	notify-send -a "openSUSE TumbleWeed Updates" "Up to date" "No packages need to be upgraded"
fi
