#! /usr/bin/env bash

# Color prompt
function colorize-prompt
{
	if [[ -n "$TERM" ]]
	then
		if [[ "$(tput colors)" = "16" ]]
		then
			black="\[$(tput setaf 0)\]"
			red="\[$(tput setaf 9)\]"
			green="\[$(tput setaf 10)\]"
			orange="\[$(tput setaf 11)\]" # yellow
			blue="\[$(tput setaf 12)\]"
			purple="\[$(tput setaf 13)\]"
			cyan="\[$(tput setaf 14)\]"
			white="\[$(tput setaf 15)\]"
			reset="\[$(tput sgr0)\]"
		else
			black="\[$(tput setaf 0)\]"
			red="\[$(tput setaf 1)\]"
			green="\[$(tput setaf 2)\]"
			orange="\[$(tput setaf 3)\]"
			blue="\[$(tput setaf 4)\]"
			purple="\[$(tput setaf 5)\]"
			cyan="\[$(tput setaf 6)\]"
			white="\[$(tput setaf 7)\]"
			reset="\[$(tput sgr0)\]"
		fi
		export PS1="${blue}(${purple}\A ${green}\u${cyan}@${red}\h ${purple}\W ${orange}\$${blue})->${reset}"
		unset black red green orange blue purple cyan white reset
	fi
}

# Color man
function colorize-less()
{
	export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
	export LESS_TERMCAP_md=$(tput bold; tput setaf 5) # purple
	export LESS_TERMCAP_me=$(tput sgr0)
	export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 1) # yellow on red
	export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
	export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 2) # green
	export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
	export LESS_TERMCAP_mr=$(tput rev)
	export LESS_TERMCAP_mh=$(tput dim)
	export LESS_TERMCAP_ZN=$(tput ssubm)
	export LESS_TERMCAP_ZV=$(tput rsubm)
	export LESS_TERMCAP_ZO=$(tput ssupm)
	export LESS_TERMCAP_ZW=$(tput rsupm)
	export LESS="--RAW-CONTROL-CHARS"
}
