#!/bin/sh
shopt -s lastpipe

firefoxprofile=("personal" "social" "school")

printf "%s\n" "${firefoxprofile[@]}" | fuzzel -P "Select Firefox Profile: " -s FFFACDff -t 5E81ACff -b 2e3440ff -r 0 -C 5E81ACff -f "mononoki Nerd Font:size=10" -x 30 -w 40 -y 100 -p 0 -l 3 --dmenu | read -r profile

[ -z "${profile}" ] && exit
if [ -x "$(command -v firefox)" ]
then
    command="firefox -P \"${profile}\""
	setsid /bin/sh -c "${command}" >&/dev/null &
	sleep 0.3
elif [ -x "$(command -v flatpak)" ]
then
    if [ "Firefox" == "$(flatpak --user list | grep Firefox | awk '{print $1}')" ]
    then
        command="flatpak --user run org.mozilla.firefox -P \"${profile}\""
		setsid /bin/sh -c "${command}" >&/dev/null &
		sleep 0.3
    else
        notify-send -u "critical" "Trying to use flatpak but Firefox is not installed! Install Firefox"
        exit
    fi
else
    notify-send -u "critical" "Trying to use flatpak has failed! Command not found!"
    notify-send -u "critical" "Firefox is not installed! Install Firefox!"
    exit
fi

[ -z "${profile}" ]  && exit

