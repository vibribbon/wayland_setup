#!/bin/bash

# Find all recently modified files within the last day
# format \n is new line between ites, %AF = yyyy-mm-dd, %AR = hh-mm, %p is filename.
find /home -type f -newerat "1 day ago" -printf "\n%AF %AT. | %p" 2>/dev/null | sed 's/\.[^\.]*\.//' | sort -r | less -i
