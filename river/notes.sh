#!/usr/bin/env bash

shopt -s lastpipe

USEFUL_NOTES="$HOME/useful-notes"
IFS=$'\n' read -r -d '' -a MARKDOWN <<< "$(find "$USEFUL_NOTES" -name "*.md")"
NOTES=( ${MARKDOWN[@]} "Create new note" )
for i in "${NOTES[@]}"; do echo "$i"; done | sort | fzf -e -i --prompt='notes: ' --preview '
	tmpstuff={}
	if [ "${tmpstuff}" = "Create new note" ]
	then
		echo "Create a new note"
	else 
		bat {}
	fi 
	' | read -r answer

[ -z "${answer}" ] && exit

case "${answer}" in 
	"Create new note")
	command="source ~/.zshenv; kitty -o initial_window_width=640 -o initial_window_height=100 -o remember_window_size=no --class launcher newnotes.sh"
	setsid /bin/sh -c "${command}" >&/dev/null &
	sleep 0.3s 
	;;
	*)
	command="source ~/.zshenv; kitty nvim \"${answer}\""
	setsid /bin/sh -c "${command}" >&/dev/null &
	sleep 0.3s
	;;
esac
		
