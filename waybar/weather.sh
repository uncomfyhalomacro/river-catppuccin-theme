#!/bin/sh 

declare weather_info
latitude="$(curl "https://json.geoiplookup.io/$(curl https://ipinfo.io/ip)" | grep -i "latitude" | awk '{print $NF}' | cut -d',' -f1)"
longitude="$(curl "https://json.geoiplookup.io/$(curl https://ipinfo.io/ip)" | grep -i "longitude" | awk '{print $NF}' | cut -d',' -f1)"
if [ -n "${latitude}" ] && [ -n "${longitude}" ];
then
    echo "${latitude} ${longitude}" > "$HOME"/.weather
    weather_info="$(curl "wttr.in/~${latitude},${longitude}?format=4")"
else
    latitude="$(cat "$HOME"/.weather | awk '{print $1}')"
    longitude="$(cat "$HOME"/.weather | awk '{print $2}')"
    weather_info="$(curl "wttr.in/~${latitude},${longitude}?format=4")"
fi

echo "${weather_info}" | awk '{print $2" "$3}'

