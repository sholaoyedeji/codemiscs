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
