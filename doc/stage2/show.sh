# /usr/bin/env bash

function fortune-show
{
	while true
	do
		clear
		title="${1:-FORTUNE SHOW}"; shift
		figure="${2:-tux}"
		cols="${3}"
		show cookie "$title" "$figure" "$cols" --sound --foreground
		sleep 1
	done
}
