#!/usr/bin/bash

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
	USEFUL_NOTES="$HOME/useful-notes"
	echo -e "Name of note:"
	read -r answer
	[ -z "${answer}" ] && exit
	command="source ~/.zshenv; foot nvim \"${USEFUL_NOTES}/${answer// /-}.md\""
	setsid /bin/sh -c "${command}" >&/dev/null &
	sleep 0.3s 
	;;
	*)
	command="source ~/.zshenv; foot nvim \"${answer}\""
	setsid /bin/sh -c "${command}" >&/dev/null &
	sleep 0.3s
	;;
esac
		
