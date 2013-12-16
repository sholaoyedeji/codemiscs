#! /usr/bin/env bash

# December 16th, 2013, Juan Manuel Borges Caño

charsecs="${1:-0.05}"
linesecs="${2:-0.05}"
while IFS="" read -r line
do
	printf "%s" "$line" | while IFS="" read -r -n 1 char
	do
		printf "%c" "$char"
		sleep "$charsecs"
	done
	printf "\n"
	sleep "$linesecs"
done
