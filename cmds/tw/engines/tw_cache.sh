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
#   |                             Cache Plugin                              |
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

function tw_cache_name
{
	printf "%s\n"  "cache"
}

function tw_cache_shortcut
{
	printf "%s\n"  "ca"
}

function tw_cache_list
{
	if [[ -d "$HOME/.tw" ]]
	then
		for twp_twd in "$HOME/.tw"/*.twdc
		do
			twp_dict="$twp_twd"
			twp_dict="${twp_dict##*/}"
			twp_dict="${twp_dict%.*}"
			printf "%s\n"  "$twp_dict"
		done
	fi
}

# This does cache translation
function tw_cache
{
	if (( "$(wc -l <<< "$tw_input")" == "1" )) && (( "$(wc -w <<< "$tw_input")" <= "5" ))
	then
		twp_twd="$HOME/.tw/$tw_dict.twdc"
		if [[ -f "$twp_twd" ]]
		then
			tw_output="$(
			{
				gawk -F " : " -v input="$tw_input" 'tolower($1) == tolower(input) { print $2 }' "${twp_twd}"
				if cmd_switch "$tw_synonyms"
				then
					tw_mythes "${tw_dict%%-*}" "$tw_input" |  while read -r twp_myth
					do
						gawk -F " : " -v input="$twp_myth" 'tolower($1) == tolower(input) { print $2 }' "${twp_twd}"
					done
				fi
			} | sort -u
			)"
			if ! cmd_switch "$tw_exact"
			then
				tw_outputextra="$(
					gawk -F " : " -v input="$tw_input" 'tolower($1) ~ tolower(input) && tolower($1) != tolower(input) { print }' "${twp_twd}" | sort -u
				)"
			fi
		fi
	else
		cmd_error "term not supported"
	fi
}
