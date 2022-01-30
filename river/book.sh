#!/bin/sh

shopt -s lastpipe

DOC="$HOME/Documents"
export tmp_pdf_file=$(mktemp)
IFS=$'\n' read -r -d '' -a PDF <<< "$(find "$DOC" -name "*.pdf")"
IFS=$'\n' read -r -d '' -a EPUB <<< "$(find "$DOC" -name "*.epub")"
BOOKS=( "${PDF[@]}" "${EPUB[@]}" )
for i in "${BOOKS[@]}"; do echo "$i"; done | sort | fzf --sync -e -i --prompt='read book: ' --preview '
	tmpstuff={}
	if [ "${tmpstuff: -4}" = ".pdf" ]
	then
		pdftotext {} $tmp_pdf_file
	else
		epub2txt {} > $tmp_pdf_file
	fi
	bat ${tmp_pdf_file}
	' | read -r book
rm $tmp_pdf_file

[ -z "${book}" ]  && exit

command="zathura \"$book\""
# riverctl spawn "${command}"

setsid /bin/sh -c "${command}" >&/dev/null &
sleep 0.3s
