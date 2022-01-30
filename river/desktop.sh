#!/usr/bin/env bash
# Launcher for executables in $PATH

shopt -s lastpipe
source ~/.bashrc
unset QT_QPA_PLATFORMTHEME
IFS=$'\n' read -r -d '' -a desktops <<< "$(find /usr/share/applications /usr/local/share/applications $HOME/.local/share/applications $HOME/.local/share/flatpak/exports/share/applications $HOME/.var/app/com.valvesoftware.Steam/Desktop -name "*.desktop" 2> /dev/null)"

for i in "${desktops[@]}"; do echo "$(cat "${i}" | awk -F: '/^Name=/{sub(/^Name=/, ""); print; exit}')" ; done | sort | uniq | fzf --sync -e -i  --prompt='launch: ' | read -r cmd
for i in "${desktops[@]}"
do
    if grep -Fxq "Name=${cmd}" "${i}"
    then
        Exec="$(cat "${i}" | awk -F: '/^Exec=/{sub(/^Exec=/,""); print; exit}' | sed -E 's/%(U|F|u)//g')"
        Terminalorno="$(cat "${i}" | awk '/^Terminal=/{sub(/^Terminal=/,""); print}')"
        [ -z "${Exec}" ] && exit
		case "${Terminalorno}" in
			true)
            setsid /bin/sh -c "${1} ${Exec}" >&/dev/null &
            sleep 0.3 
			;;
			*)
            setsid /bin/sh -c "${Exec}" >&/dev/null &
            sleep 0.3 
			;;
		esac
        break
    fi
done



    
