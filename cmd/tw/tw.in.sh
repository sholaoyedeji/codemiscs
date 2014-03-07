#! /usr/bin/env bash

#  _________________________________________________________________________
# /\                                                                        \
# \_|       ___        __                            _   _                  |
#   |      |_ _|_ __  / _| ___  _ __ _ __ ___   __ _| |_(_) ___  _ __       |
#   |       | || '_ \| |_ / _ \| '__| '_ ` _ \ / _` | __| |/ _ \| '_ \      |
#   |       | || | | |  _| (_) | |  | | | | | | (_| | |_| | (_) | | | |     |
#   |      |___|_| |_|_|  \___/|_|  |_| |_| |_|\__,_|\__|_|\___/|_| |_|     |
#   |                                                                       |
#   |             tw (Translate Word): Human Language Translator            |
#   |           Copyright (C) 2007 - 2014 Juan Manuel Borges Caño           |
#   |                  The need for an smart, fast and rich                 |
#   |               translation answer inspired this command.               |
#   |                    _     _                                            |
#   |                   | |   (_) ___ ___ _ __  ___  ___                    |
#   |                   | |   | |/ __/ _ \ '_ \/ __|/ _ \                   |
#   |                   | |___| | (_|  __/ | | \__ \  __/                   |
#   |                   |_____|_|\___\___|_| |_|___/\___|                   |
#   |                                                                       |
#   |  This program is free software: you can redistribute it and/or modify |
#   |  it under the terms of the GNU General Public License as published by |
#   |   the Free Software Foundation, either version 3 of the License, or   |
#   |                  (at your option) any later version.                  |
#   |                                                                       |
#   |    This program is distributed in the hope that it will be useful,    |
#   |     but WITHOUT ANY WARRANTY; without even the implied warranty of    |
#   |     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the     |
#   |              GNU General Public License for more details.             |
#   |                                                                       |
#   |   You should have received a copy of the GNU General Public License   |
#   | along with this program.  If not, see <http://www.gnu.org/licenses/>. |
#   |   ____________________________________________________________________|_
#    \_/______________________________________________________________________/

shopt -s extglob

# The --list option
function tw_option_list
{
	for tw_plugin in "$cmd_datadir/engines"/{tw_share,tw_cache,tw_local,!(tw_share|tw_cache|tw_local)}.sh
	do
		tw_twp="$tw_plugin"
		tw_twp="${tw_twp##*_}"
		tw_twp="${tw_twp%.*}"
		"tw_${tw_twp}_list" | sed -e "s/^/$("tw_${tw_twp}_name")./g"
	done
	exit 0
}

# The --shortcuts option
function tw_option_shortcuts
{
	for tw_plugin in "$cmd_datadir/engines"/{tw_share,tw_cache,tw_local,!(tw_share|tw_cache|tw_local)}.sh
	do
		tw_twp="$tw_plugin"
		tw_twp="${tw_twp##*_}"
		tw_twp="${tw_twp%.*}"
		printf "%s\n" "$("tw_${tw_twp}_name") = $("tw_${tw_twp}_shortcut")"
	done
	exit 0
}

# The --exact option
function tw_option_exact
{
	tw_exact="on"
}

# The --synonyms option
function tw_option_synonyms
{
	tw_synonyms="on"
}

# The --spelling option
function tw_option_spelling
{
	tw_spelling="on"
}

# The --speak option
function tw_option_speak
{
	tw_speak="on"
}

# The --disable-logging option
function tw_option_disable_logging
{
	tw_logging="off"
}

# The plugin loader
function tw_load_plugins
{
	for tw_plugin in "$cmd_datadir/engines"/{tw_share,tw_cache,tw_local,!(tw_share|tw_cache|tw_local)}.sh
	do
		source "$tw_plugin"
	done
}

# The spelling helper
function tw_aspell
{
	if cmd_switch "$tw_spelling"
	then
		printf "%s\n" "$tw_input" | aspell -d "${tw_dict%%-*}" -a 2> /dev/null | sed -ne '/^&/s/^& \([^ ]\+\) [0-9]\+ [0-9]\+: \(.*\)/possible misspelling of \`\1'\'', did you mean: \2?/p' | while read -r tw_msg
		do
			cmd_warning "$tw_msg"
		done
	fi
}

# The speak helper
function tw_espeak
{
	if cmd_switch "$tw_speak"
	then
		espeak -v "${tw_dict%%-*}" "$tw_input" 2> /dev/null
		[[ -n "$tw_output" ]] && espeak -v "${tw_dict##*-}" "$tw_output" 2> /dev/null
	fi
}

# The translation plugin helper: dict 
function tw
{
	if [[ -n "$tw_output" ]] || [[ -n "$tw_outputextra" ]]
	then
		tw_twd="$cmd_datadir/dicts/$tw_dict.twd"
		tw_twdc="$HOME/.tw/$tw_dict.twdc"
		if [[ -n "$tw_output" ]]
		then
			printf "%s\n" "$tw_output"
			if [[ -d "$HOME/.tw" ]] && (( "$(printf "%s\n" "$tw_input" | wc -l)" == "1" )) && (( "$(printf "%s\n" "$tw_input" | wc -w)" <= "5" ))
			then
				printf "%s\n" "$tw_output" | while read -r tw_term
				do
					if (( "$(printf "%s\n" "$tw_term" | wc -w)" <= "5" )) && ! grep -qsxi -- "$tw_input : $tw_term" "$tw_twd" "$tw_twdc"
					then
						printf "%s\n" "$tw_input : $tw_term" >> "$tw_twdc"
					fi
				done
			fi
		fi
		if [[ -n "$tw_outputextra" ]]
		then
			printf "%s\n" "$tw_outputextra"
			if cmd_switch "$tw_exactextra" && [[ -d "$HOME/.tw" ]] && (( "$(printf "%s\n" "$tw_input" | wc -l)" == "1" )) && (( "$(printf "%s\n" "$tw_input" | wc -w)" <= "5" ))
			then
				printf "%s\n" "$tw_outputextra" | while read -r tw_termextra
				do
					if (( "$(printf "%s\n" "$tw_termextra" | wc -w)" <= "5" )) && ! grep -qsxi -- "$tw_input : $tw_termextra" "$tw_twd" "$tw_twdc"
					then
						printf "%s\n" "$tw_input : $tw_termextra" >> "$tw_twdc"
					fi
				done
			fi
		fi
		tw_espeak &
	else
		if cmd_switch "$tw_logging" && [[ -d "$HOME/.tw" ]] && (( "$(printf "%s\n" "$tw_input" | wc -l)" == "1" )) && (( "$(printf "%s\n" "$tw_input" | wc -w)" <= "5" ))
		then
			tw_twdf="$HOME/.tw/$tw_dict.twdf"
			printf "%s\n" "$tw_input" >> "$tw_twdf"
			cmd_error "term not found (maybe not connected) logged $tw_twdf"
		else
			cmd_error "term not found (maybe not connected)"
		fi
	fi
	exit 0
}

# ... and tw, the program itself # The cmd init function
function tw_init
{
	shopt -s extglob
	shopt -s nullglob

	tw_load_plugins
	source "$cmd_datadir/tw_mythes.sh" 

	tw_logging="on"
	tw_exact="off"
	tw_synonyms="off"
	tw_speak="off"
	tw_spelling="off"
}

# The cmd main function
function tw_main
{
	# This checks for correct input
	if [[ -z "$1" ]]
	then
		cmd_error "unknown action"
	fi

	# This identifies the engine
	tw_engine="${1%.*}"
	if [[ "$tw_engine" = "$1" ]]
	then
		tw_engine="local"
	fi

	# This identifies the dict
	tw_dict="${1##*.}"

	# This prepares input
	if [[ -z "$2" ]] || [[ "$2" = "-" ]]
	then
		tw_input="$(cat -)"
	else
		tw_input="$2"
	fi

	# This prepares output
	tw_output=""
	tw_outputextra=""
	tw_exactextra="off"

	# This performs the plugin translation
	tw_aspell
	for tw_plugin in "$cmd_datadir/engines"/{tw_share,tw_cache,tw_local,!(tw_share|tw_cache|tw_local)}.sh
	do
		tw_twp="$tw_plugin"
		tw_twp="${tw_twp##*_}"
		tw_twp="${tw_twp%.*}"
		if [[ "$tw_engine" = "$("tw_${tw_twp}_name")" ]] || [[ "$tw_engine" = "$("tw_${tw_twp}_shortcut")" ]]
		then
			"tw_${tw_twp}"
			tw
		fi
	done
	if cmd_switch "$tw_logging" && [[ -d "$HOME/.tw" ]] && (( "$(printf "%s\n" "$tw_input" | wc -l)" == "1" )) && (( "$(printf "%s\n" "$tw_input" | wc -w)" <= "5" ))
	then
		tw_twdf="$HOME/.tw/$tw_dict.twdf"
		printf "%s\n" "$tw_input" >> "$tw_twdf"
		cmd_error "term not found (engine not found) logged $tw_twdf"
	else
		cmd_error "term not found (engine not found)"
	fi
}

# The cmd fields
cmd_package="[@]pkg[@]"
cmd="tw"
cmd_name="translate word"
cmd_version="[@]pkgversion[@]"
cmd_description="Human Language Translator"
cmd_explanation="translate word is a command that translates words into different languages. tw uses internal dictionaries, and contacts online to the Google Translation and the FreeTranslation engines."
cmd_license="[@]pkglicense[@]"
cmd_homepage="[@]pkghomepage[@]"
cmd_author="[@]pkgauthor[@]"
cmd_blog="[@]pkgblog[@]"
cmd_email="[@]pkgemail[@]"
cmd_usage="$cmd [OPTIONS] [DICTIONARY] [TERM]"
cmd_options=("/l/list/list available dictionaries/tw_option_list/" "/s/shortcuts/list available dictionaries shortcuts/tw_option_shortcuts/" "/x/exact/perform an exact match/tw_option_exact/")
if [[ "[@]pkghunspell[@]" = "yes" && "[@]pkgmythes[@]" = "yes" ]] 
then
	cmd_options=("${cmd_options[@]}" "/y/synonyms/perform a synonym triangulation/tw_option_synonyms/")
fi
if [[ "[@]pkgaspell[@]" = "yes" ]]
then
	cmd_options=("${cmd_options[@]}" "/p/spelling/check the spelling grammar/tw_option_spelling/")
fi
if [[ "[@]pkgespeak[@]" = "yes" ]]
then
	cmd_options=("${cmd_options[@]}" "/k/speak/speak the text/tw_option_speak/")
fi
cmd_options=("${cmd_options[@]}" "/d/disable-logging/disable logging of failure terms/tw_option_disable_logging/")
cmd_examples=("$cmd en-es hello")
cmd_extrahelp="With no term, or when term is -, read standard input. Create ~/.$cmd directory to enable caching and logging (mkdir ~/.$cmd)."
if [[ "[@]pkgmythes[@]" = "yes" ]]
then
	cmd_extrahelp+=" For straight synonyms, check mythes command."
fi
cmd_extranotes="Machines Content, Respect terms of online services. For more information, check documentation."
cmd_init="tw_init"
cmd_main="tw_main"

cmd_datadir="[@]pkgdatadir[@]/$cmd"

# The cmd environment
source "[@]pkgdatadir[@]/cmd.sh"
