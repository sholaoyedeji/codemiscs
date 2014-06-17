#! /usr/bin/env bash

printf "%s\n" "RunCMD By Juan Manuel Borges Caño" | colorize fancy
printf "%s\n" "$@" | colorize smart
"$@"
status $? --visible --audible
printf "%s\n" 'Job Done!' | colorize fancy
