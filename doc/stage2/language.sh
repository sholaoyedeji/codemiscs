#! /usr/bin/env bash

function define
{
	dict -d wn "$@" | colorize info
}

function translate
{
	{
		tw -x -y en-es "$@"
		tw gt.en-es "$@"
		tw ft.en-es "$@"
	} | colorize info
	echo
	{
		mythes en "$@"
	} | colorize warning
}

function traduce
{
	{
		tw -x -y es-en "$@"
		tw gt.es-en "$@"
		tw ft.es-en "$@"
	} | colorize info
	echo
	{
		mythes es "$@"
	} | colorize warning
}

function randword
{
	shuf -n 1 "/usr/share/dict/words"
}

function randdef
{
	false
	while (( "${PIPESTATUS[0]}" ))
	do
		dict -d wn "$(randword)" 2>/dev/null | tail -n +5 | colorize info
	done
}
