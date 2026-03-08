#!/bin/bash

# Download the weather file
curl -s -o "${HOME}/.cache/weather_reader/weather.xml" --create-dirs -L 'https://weather-broker-cdn.api.bbci.co.uk/en/forecast/rss/3day/2643743'
sleep 1

echo '-------------------------------------------------------------------------'
echo '-- BBC WEATHER ----------------------------------------------------------'
grep -E '^      <title>|^    <pubDate>' ~/.cache/weather_reader/weather.xml | sed -e 's/      <title>/\- /g' -e 's/<\/title>/\
/g' -e 's/    <pubDate>//g' -e 's/<\/pubDate>//g' | fold -s -w 80
echo '-------------------------------------------------------------------------'
