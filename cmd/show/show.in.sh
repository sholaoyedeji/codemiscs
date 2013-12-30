#! /usr/bin/env bash

#  _________________________________________________________________________
# /\                                                                        \
# \_|       ___        __                            _   _                  |
#   |      |_ _|_ __  / _| ___  _ __ _ __ ___   __ _| |_(_) ___  _ __       |
#   |       | || '_ \| |_ / _ \| '__| '_ ` _ \ / _` | __| |/ _ \| '_ \      |
#   |       | || | | |  _| (_) | |  | | | | | | (_| | |_| | (_) | | | |     |
#   |      |___|_| |_|_|  \___/|_|  |_| |_| |_|\__,_|\__|_|\___/|_| |_|     |
#   |                                                                       |
#   |               show (Shell Show): Show Fun (Early stages)              |
#   |               Copyright (C) 2013 Juan Manuel Borges Caño              |
#   |                      Terminal graphics amaze me.                      |
#   |      Some shows are based on the gathering of http://mewbies.com/     |
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


# The shows
sh_shows=(cookie box clock pipes ants mandelbrot matrix weave)

# The --list option
function sh_option_list
{
	for sh_show in "${sh_shows[@]}"
	do
		printf "%s\n" "$sh_show"
	done
	exit 0
}

# The --sound option
function sh_option_sound
{
	sh_sound="on"
}

# The --foreground option
function sh_option_foreground
{
	sh_foreground="on"
}

# Show Time!

# The cookie
function sh_cookie
{
	sh_message="${1:-"Tux Says:"}"
	sh_cowfile="${2:-tux}"
	sh_cols="${3:-$(($(tput cols) / 2))}"
	sh_fortune="$4"
	sh_epigram="${5:-"$(fortune -a -s "$sh_fortune" | fmt -"$sh_cols" -s)"}"
	sh_cookie="$(cowsay -f "${2:-tux}" -W "$sh_cols" -n <<< "$sh_epigram")"
	sh_cols="$(wc -L <<< "$sh_cookie")"
	sh_shift=$((($(tput cols) - $sh_cols) / 2))
	sh_shift=$(printf "%${sh_shift}s" "")
	figlet -t -c "$sh_message" | colorize info
	printf "%s\n" "$sh_cookie" | sed -e "s/^/$sh_shift/g" | colorize warning
	if cmd_switch "$sh_sound"
	then
		if cmd_switch "$sh_foreground"
		then
			bash -c 'festival --tts <<< "$1" 2>/dev/null' _ "$sh_epigram "
		else
			bash -c 'festival --tts <<< "$1" 2>/dev/null &' _ "$sh_epigram "
		fi
	fi
	exit 0
}

# The box
function sh_box
{
	sh_message="${1:-"Fortune"}"
	sh_box="${2:-parchment}"
	sh_cols="${3:-$(($(tput cols) / 2))}"
	sh_fortune="$4"
	sh_epigram="${5:-"$(fortune -a -s "$sh_fortune" | fmt -"$sh_cols" -s)"}"
	sh_box="$(boxes -d "$sh_box" -s "$sh_cols" <<< "$sh_epigram")"
	sh_cols="$(wc -L <<< "$sh_box")"
	sh_shift=$((($(tput cols) - $sh_cols) / 2))
	sh_shift=$(printf "%${sh_shift}s" "")
	figlet -t -c "$sh_message" | colorize info
	printf "%s\n" "$sh_box" | sed -e "s/^/$sh_shift/g" | colorize warning
	if cmd_switch "$sh_sound"
	then
		if cmd_switch "$sh_foreground"
		then
			bash -c 'festival --tts <<< "$1" 2>/dev/null' _ "$sh_epigram "
		else
			bash -c 'festival --tts <<< "$1" 2>/dev/null &' _ "$sh_epigram "
		fi
	fi
	exit 0
}

# The clock
function sh_clock
{
	if cmd_switch "$sh_foreground"
	then
		while sleep 1
		do
			tput sc
			tput cup 0 $(($(tput cols)-29))
			date
			tput rc
		done
	else
		while sleep 1
		do
			tput sc
			tput cup 0 $(($(tput cols)-29))
			date
			tput rc
		done &
	fi
}

# The pipes
function sh_pipes
{
	# The author of the original script is unknown to me. The first entry I can
	# find was posted at 2010-03-21 09:50:09 on Arch Linux Forums (doesn't mean the
	# poster is the author at all):
	#
	#   https://bbs.archlinux.org/viewtopic.php?pid=728932#p728932
	#
	# I, Yu-Jie Lin, made a few changes and additions:
	#
	#   -p, -t, -R, and -C
	#
	#   Screenshot: http://flic.kr/p/dRnLVj
	#   Screencast: http://youtu.be/5XnGSFg_gTk
	#
	# And push the commits to Gist:
	#
	#   https://gist.github.com/4689307
	#
	# I, Devin Samarin, made a few changes and additions:
	#
	#   -r can be 0 to mean "no limit".
	#   Reset cursor visibility after done.
	#   Cleanup for those people who want to quit with ^C
	#
	#   Pushed the changes to https://gist.github.com/4725048

	p=1
	f=75 s=13 r=2000 t=0
	w=$(tput cols) h=$(tput lines)
	# ab -> idx = a*4 + b
	# 0: up, 1: right, 2: down, 3: left
	# 00 means going up   , then going up   -> ┃
	# 12 means going right, then going down -> ┓
	sets=(
	    "┃┏ ┓┛━┓  ┗┃┛┗ ┏━"
	    "│╭ ╮╯─╮  ╰│╯╰ ╭─"
	    "│┌ ┐┘─┐  └│┘└ ┌─"
	    "║╔ ╗╝═╗  ╚║╝╚ ╔═"
	)
	v="${sets[0]}"
	RNDSTART=0
	NOCOLOR=0

	OPTIND=1
	while getopts "p:t:f:s:r:RCh" arg; do
	case $arg in
	    p) ((p=(OPTARG>0)?OPTARG:p));;
	    t) ((OPTARG>=0 && OPTARG<${#sets[@]})) && v="${sets[OPTARG]}";;
	    f) ((f=(OPTARG>19 && OPTARG<101)?OPTARG:f));;
	    s) ((s=(OPTARG>4 && OPTARG<16 )?OPTARG:s));;
	    r) ((r=(OPTARG>=0)?OPTARG:r));;
	    R) RNDSTART=1;;
	    C) NOCOLOR=1;;
	    h) echo -e "Usage: $(basename $0) [OPTION]..."
		echo -e "Animated pipes terminal screensaver.\n"
		echo -e " -p [1-]\tnumber of pipes (D=1)."
		echo -e " -t [0-$((${#sets[@]} - 1))]\ttype of pipes (D=0)."
		echo -e " -f [20-100]\tframerate (D=75)."
		echo -e " -s [5-15]\tprobability of a straight fitting (D=13)."
		echo -e " -r LIMIT\treset after x characters, 0 if no limit (D=2000)."
		echo -e " -R \t\trandom starting point."
		echo -e " -C \t\tno color."
		echo -e " -h\t\thelp (this screen).\n"
		exit 0;;
	    esac
	done

	cleanup() {
	    tput rmcup
	    tput cnorm
	    exit 0
	}
	trap cleanup SIGHUP SIGINT SIGTERM

	for (( i=1; i<=p; i++ )); do
	    c[i]=$((i%8)) n[i]=0 l[i]=0
	    ((x[i]=RNDSTART==1?RANDOM*w/32768:w/2))
	    ((y[i]=RNDSTART==1?RANDOM*h/32768:h/2))
	done

	tput smcup
	tput reset
	tput civis
	while ! read -t0.0$((1000/f)) -n1; do
	    for (( i=1; i<=p; i++ )); do
		# New position:
		((${l[i]}%2)) && ((x[i]+=-${l[i]}+2,1)) || ((y[i]+=${l[i]}-1))

		# Loop on edges (change color on loop):
		((${x[i]}>w||${x[i]}<0||${y[i]}>h||${y[i]}<0)) && ((c[i]=RANDOM%8))
		((x[i]=(x[i]+w)%w))
		((y[i]=(y[i]+h)%h))

		# New random direction:
		((n[i]=RANDOM%s-1))
		((n[i]=(${n[i]}>1||${n[i]}==0)?${l[i]}:${l[i]}+${n[i]}))
		((n[i]=(${n[i]}<0)?3:${n[i]}%4))

		# Print:
		tput cup ${y[i]} ${x[i]}
		[[ $NOCOLOR == 0 ]] && echo -ne "\033[1;3${c[i]}m"
		echo -n "${v:l[i]*4+n[i]:1}"
		l[i]=${n[i]}
	    done
	    ((r>0 && t*p>=r)) && tput reset && tput civis && t=0 || ((t++))
	done

	cleanup
	exit 0
}

# The ants
function sh_ants
{
	echo -ne "\033#8";X=`tput cols`;Y=`tput lines`;((a=$X/2));((b=$Y/2));d=1;while case $d in 0)((a=a<2?X:a-1));;1)((b=b<2?Y:b-1));;2)((a=a==X?1:a+1));;3)((b=b==Y?1:b+1));; esac;do ((c=b+a*X));v=${k[c]:- };[ $v. = @. ]&&{((d=d>2?0:d+1));k[c]="";}||{(( d=d<1?3:d-1));k[c]=@;};echo -ne "\033[$b;${a}H$v";done # Langtons Ants # Charles Cooke
	exit 0
}

# The mandelbrot
function sh_mandelbrot
{
	for((P=${1:-10}**8,Q=P/${2:-100},X=320*Q/(`tput cols`-1),Y=210*Q/`tput lines`,y=-105*Q,v=-220*Q,x=v;y<105*Q;x=v,y+=Y));do for((;x<P;a=b=i=k=c=0,x+=X));do for((;a*a+b*b<2*P*P&&i++<99;a=((c=a)*a-b*b)/P+x,b=2*c*b/P+y));do :;done;(((j=(i<99?i%16:0)+30)>37?k=1,j-=8:0));echo -ne "\E[$k;$j"mE;done;echo -e "\E[0m";done # Langtons Mandelbrot # Charles Cooke
	exit 0
}

# The matrix
function sh_matrix
{
	# Based on Blue Matrix by dave1010 http://www.commandlinefu.com/commands/view/5712/blue-matrix 
	# matrix 2
	# matrix "$(printf "%i " {112..123})"

	sh_colors="${1:-$(printf "%i " {0..7})}"
	sh_colors=( $sh_colors )
	sh_rows="${2:-27}"
	sh_cols="${3:-$(tput cols)}"
	while :; do i=0; COL=$((RANDOM%sh_rows));ROW=$((RANDOM%sh_cols));while [ $i -lt $COL ]; do tput cup $i $ROW; tput setaf ${sh_colors[$((RANDOM%${#sh_colors[@]}))]}; echo "$(head -1 /dev/urandom | cut -c1-1)" 2>/dev/null ; i=$((i+1)); done; done
}

# The weave 
function sh_weave
{
	# Weaving with simple math in terminal
	# https://bitbucket.org/livibetter/weave.sh
	# Copyright (c) 2013 Yu-Jie Lin

	# weave '((x + y) % 2)
	# weave '(((y % 4) && (x % 4)))'
	# weave '(( $(echo "v=s(($x-1)*2*4*a(1)/$W);scale=0;$H-$H*(v+1)/2 == $y" | bc -l) ))'

	VERSION=0.1.0

	# Characters and colors for vertical and horizontal lines
	: ${char_v:='|'}            ${char_h:='-'}
	: ${color_v:='\e[32;1m'}    ${color_h:='\e[31;1m'}

	# Sleep delays
	: ${sleep_v:=0.01}          ${sleep_h:=0.01}
	: ${sleep_end:=5}

	: ${eval_h:="$1"}           Get evaluation code from '$1'
	: ${eval_h:='(((y % 4) && (x % 4)))'}  , or set to a default pattern
	: ${show_eval_h:=no}        "yes" to print out evaluation code

	W=$(tput cols)              H=$(tput lines)


	draw_v() {
	  local line y
	  printf -v line '%*s' $W ; line=${line// /$char_v}
	  for ((y=1; y<=H; y++)); do
	    echo -ne "\e[${y};1H${color_v}${line}"
	    sleep $sleep_v
	  done
	}

	draw_h() {
	  local x y
	  for ((x=1; x<=W; x++)); do
	    for ((y=1; y<=H; y++)); do
	      eval "$eval_h" && echo -ne "\e[${y};${x}H${color_h}${char_h}"
	    done
	    sleep $sleep_h
	  done
	}

	main() {
	  clear
	  draw_v
	  draw_h
	  [[ $show_eval_h == yes ]] && echo -ne "\e[$H;1H\e[0m${eval_h:0:$W}"
	  sleep $sleep_end
	}


	main
	exit 0
}

# ... and show, the program itself.

# The cmd init function
function sh_init
{
	sh_sound="off"
	sh_foreground="off"
	sh_show="cookie"
}

# The cmd main function
function sh_main
{
	sh_showsel="${1:-cookie}"
	for sh_show in "${sh_shows[@]}"
	do
		if [[ "$sh_show" = "$sh_showsel" ]]
		then
			shift
			"sh_$sh_show" "$@"
		fi
	done
	cmd_error "unknown show"
}

# The cmd fields
cmd="show"
cmd_name="shell show"
cmd_description="Show Fun"
cmd_explanation="shell show is a command that displays nice graphical shell art. shell show has various effects combined."
cmd_version="[@]pkgversion[@]"
cmd_author="[@]pkgauthor[@]"
cmd_homepage="[@]pkghomepage[@]"
cmd_blog="[@]pkgblog[@]"
cmd_email="[@]pkgemail[@]"
cmd_usage="$cmd [OPTIONS] [SHOW] [-- SHOWOPTIONS]"
cmd_examples=("$cmd cookie")
cmd_options=("/l/list/list shows/sh_option_list/" "/s/sound/play a sound/sh_option_sound/" "/f/foreground/work in foreground/sh_option_foreground/")
cmd_extrahelp="By default shows a cookie."
cmd_extranotes="For more information, check man documentation."
cmd_init="sh_init"
cmd_main="sh_main"

cmd_datadir="[@]pkgdatadir[@]"

# The cmd environment
source "$cmd_datadir/cmd.sh"
