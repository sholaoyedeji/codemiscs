#! /usr/bin/env bash

printf "%s" "RunCMD By Juan Manuel Borges Caño" | colorize fancy
printf "%s" "$@" | colorize smart
"$@"
status $? --visible --audible
printf "%s\n" 'Job Done!' | colorize fancy
