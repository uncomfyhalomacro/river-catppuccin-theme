#!/bin/sh 

shopt -s lastpipe

#clipman pick -t STDOUT | fzf --sync -e -i --prompt="clipboard: "  | read -r hmm
clipman pick -t STDOUT | fuzzel -P "clipboard: " -p 150 -s 1E1E2Eff -S EFB8CCff -t 5E81ACff -b 161622ff -r 0 -F exec -T foot -C 5E81ACff -f "mononoki Nerd Font:size=10" -x 30 -w 40 -y 70 -p 0 -l 20 --show-actions --fuzzy-min-length 10 --dmenu | read -r hmm

[ -z "${hmm}" ] && exit

command="wl-copy \"${hmm}\""

setsid /bin/sh -c "${command}" >&/dev/null &
sleep 0.3




