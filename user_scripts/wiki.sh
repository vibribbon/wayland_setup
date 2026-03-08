#!/bin/bash
# This is an imperfect wiki reader.
# it takes a single parameter and will search wikipedia and return the 
# predominant article, then strip all its syntax for reading interminal.


waddress="https://en.m.wikipedia.org/wiki/"
waddress+=$1

curl -s -o "${HOME}/.cache/wiki_reader/wiki.html" --create-dirs -L "$waddress"
sleep 1

# Pattern matching to only pull lines with text, then remove html 
# syntax and introduce spacing to make it more readable.
# Final section is to remove style and script code
grep -E '<p>|</p>|<h|<div|<li|<title>' ~/.cache/wiki_reader/wiki.html | grep -v '^	' | sed -e 's/<\/tr>/\
/g'  -e 's/<\/li>/<\/li>\
/g' -e 's/<\/td>/<\/td>\
/g' -e 's/<\/div>/<\/div>\
\
/g' -e 's/<\/p>/<\/p>\
\
/g' -e 's/<\/h>/<\/h>\
/g' -e 's/<title>/                    <title>/g' -e 's/>Edit<//g' -e 's/<\/th>/   /g' -e 's/^\(.*\)<style \(.*\)<\/style>\(.*\)/\1\3/g' -e 's/^\(.*\)<script>\(.*\)<\/script>\(.*\)/\1\3/g' | sed -e 's/^\(.*\)<style \(.*\)<\/style>\(.*\)/\1\3/g' -e 's/<[^>]*>//g' | uniq | fold -w 80 -s | less -s -i


