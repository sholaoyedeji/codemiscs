#! /usr/bin/env bash

printf "%s\n" "RunCMD By Juan Manuel Borges Caño" | colorize fancy
printf "%s\n" "$*" | colorize smart
"$@"
status --visible='Job Ended!' --audible --check $? --code
#status --visible='Job Done!' --visible-positive smart --visible-negative health --audible --audible-positive phaser --audible-negative fail --check $? --code
printf "%s\n" 'RunCMD, Code Miscellaneous, Computer Code' | colorize fancy
