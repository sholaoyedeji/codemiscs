#! /usr/bin/env bash

#  _________________________________________________________________________
# /\                                                                        \
# \_|       ___        __                            _   _                  |
#   |      |_ _|_ __  / _| ___  _ __ _ __ ___   __ _| |_(_) ___  _ __       |
#   |       | || '_ \| |_ / _ \| '__| '_ ` _ \ / _` | __| |/ _ \| '_ \      |
#   |       | || | | |  _| (_) | |  | | | | | | (_| | |_| | (_) | | | |     |
#   |      |___|_| |_|_|  \___/|_|  |_| |_| |_|\__,_|\__|_|\___/|_| |_|     |
#   |                                                                       |
#   |       imgs (Images): Images Wizard, fetch and manipulate images       |
#   |            Copyright (C) 2013 - 2014 Juan Manuel Borges Caño          |
#   |      The thought of creating something usable from google images      |
#   |                    encouraged a research that found                   |
#   |         http://sam.nipl.net/code/nipl-tools/bin/google-images,        |
#   |       tweaked to be smart, elegant, efficient, fast and durable.      |
#   |         Combined with ImageMagick powerful manipulation tools.        |
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

# The modes
imgs_modes=(fetch unify slideshow fortune custom)

# The --list option
function imgs_option_list()
{
	for imgs_mode in "${imgs_modes[@]}"
	do
		printf "%s\n" "$imgs_mode"
	done
	exit 0
}

# The fetch mode
function imgs_fetch
{
#	# Tweaked http://sam.nipl.net/code/nipl-tools/bin/google-images to be silent, and elegant
#	[ $# = 0 ] && cmd_error "Usage: query count parallel safe opts timeout tries agent1 agent2"
#
#	query=$1 count=${2:-100} parallel=${3:-10} safe=$4 opts=$5 timeout=${6:-10} tries=${7:-2} agent1=${8:-Mozilla/5.0 (X11; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0} agent2=${9:-Googlebot-Image/1.0}
#
#	query_esc=`perl -e 'use URI::Escape; print uri_escape($ARGV[0]);' "$query"`
#	dir=`echo "$query_esc" | sed 's/%20/-/g'`-`date +%s`; mkdir "$dir" || exit 2; cd "$dir"
#	url="http://www.google.com/search?tbm=isch&safe=$safe&tbs=$opts&q=$query_esc" procs=0
#	echo >.URL "$url" ; for A; do echo >>.args "$A"; done
#
#	htmlsplit() { tr '\n\r \t' ' ' | sed 's/</\n</g; s/>/>\n/g; s/\n *\n/\n/g; s/^ *\n//; s/ $//;'; }
#
#	for start in `seq 0 100 $[$count-1]`; do wget --quiet -U"$agent1" -T"$timeout" --tries="$tries" -O- "$url&start=$start" | htmlsplit; done | perl -ne 'use HTML::Entities; /^<a .*?href="(.*?)"/ and print decode_entities($1), "\n";' | grep '/imgres?' | perl -ne 'use URI::Escape; ($ref, $img) = map { uri_unescape($_) } /imgrefurl=(.*?)&imgurl=(.*?)&/; $ext = $img; for ($ext) { s,.*[/.],,; s/[^a-z0-9].*//i; $_ ||= "img"; } $save = sprintf("%04d.$ext", ++$i); print join("\t", $save, $img, $ref), "\n";' | tee -a .images.tsv | while IFS=$'\t' read -r save img ref; do wget --quiet -U"$agent2" -T"$timeout" --tries="$tries" --referer="$ref" -O "$save" "$img" || rm "$save" & procs=$[$procs + 1]; [ $procs = $parallel ] && { wait; procs=0; }; done
#
#	wait
#
#	echo "$dir"
#	exit 0

	# Thanks To: https://developers.google.com/image-search/v1/jsondevguide :-)
	# 3 Seconds Between Resuts, 1 Second Between Fetch
	# Don't Fetch Useless Stuff, Be Clever
	# Don't Abuse Services, Be Nice
	# Development Getting Out Of Google Services

	[ $# = 0 ] && cmd_error "Usage: query count safe rights size chromacity filetype"
	query="$1"
	count="${2:-50}"
	safe="$3" # "moderate"
	results="8"
	rights="$4" # "(cc_publicdomain|cc_attribute|cc_sharealike).-(cc_noncommercial|cc_nonderived)"
	size="$5" #icon small|medium|large|xlarge
	chromacity="$6" # "color"
	filetype="$7" # "png" "jpg"

	# Keep The sam.nipl.net Dir
	query_esc=`perl -e 'use URI::Escape; print uri_escape($ARGV[0]);' "$query"`
	dir="$(echo "$query_esc" | sed 's/%20/-/g')"-"$(date +%s)"
	mkdir "$dir" || exit 2
	cd "$dir"

	# Don't Fetch Useless Stuff, Be Clever
	for ((start=1; start<count; start+=results))
	do
		search="$(
			printf "$query\n" | curl \
				-s --connect-timeout 300 --max-time 300 \
				'https://ajax.googleapis.com/ajax/services/search/images' \
				--get --data-urlencode "v=1.0" \
				--data-urlencode "safe=$safe" \
				--data-urlencode "rsz=$results" \
				--data-urlencode "start=$start" \
				--data-urlencode "as_rights=$rights" \
				--data-urlencode "imgsz=$size" \
				--data-urlencode "imgc=$chromacity" \
				--data-urlencode "as_filetype=$filetype" \
				--data-urlencode "q@-" \
				-A "Mozilla/5.0"
		)"

		# Cache/Reference/Credit The Search
		printf "%s\n" "$search" | python -mjson.tool > ".search-$start-$((start+results-1))"
		urls="$(
			printf "%s\n" "$search" | python -c \
'
import json, sys
obj = json.load(sys.stdin)
urls = [result["url"] for result in obj["responseData"]["results"]]
for url in urls: print url
'
		)"

		# Index/Reference/Credit The URLs
		printf "%s\n" "$urls" >> ".urls"

		# Don't Abuse Services, Be Nice
		sleep 3
	done
	wget \
		--quiet -T300 --tries 3 \
		-i .urls \
		--wait 1 \
		-U "Mozilla/5.0"

	echo "$dir"
	exit 0
}

# The unify mode
function imgs_unify
{
	# Relies in ImageMagick's *convert*

	(( $# == 0 )) && cmd_error "Usage: WidthxHeight Images ..."

	images=(); for file in "${@:2:$#}"; do [[ "$(file -bi "$file" | cut -d'/' -f1)" == "image" ]] && images=( "${images[@]}" "$file" ); done
	size="$1"

	unification=$(mktemp -d "Unification-$size-XXXXXXXXXX")
	for i in ${!images[@]}; do convert -quiet -scale "$size"\! "${images[i]}" "$unification/$(printf "%.10i" "$i").png"; done

	echo "$unification"
	exit 0
}

# The slideshow mode
function imgs_slideshow
{
	(( $# == 0 )) && cmd_error "Usage: WidthxHeight Images ... SlideshowProduct.gif"

	size="$1"
	slideshow="${@:$#}"

	unification="$(imgs_unify "${@:1:$#-1}")"
	echo "$unification"

	convert -quiet -alpha off -scale "$size"\! -delay 50 -loop 0 "$unification"/* "$slideshow"
	echo "$slideshow"
	exit 0
}

# The fortune mode
function imgs_fortune
{
	size="${1:-320x240}"
	word="${2:-$(shuf /usr/share/dict/words | head -1)}"

	echo "$word"
	source=$(imgs_fetch "$word" 25)
	echo "$source"
	imgs_slideshow "$size" "$source"/* "$word.gif"
	exit 0
}

# The custom mode
function imgs_custom
{
	word="${1:-$(shuf /usr/share/dict/words | head -1)}"
	size="${2:-320x240}"
	count="${3:-50}"

	echo "$word"
	source=$(imgs_fetch "$word" "$count")
	echo "$source"
	imgs_slideshow "$size" "$source"/* "$word.gif"
	exit 0
}

# ... and imgs, the program itself

# The cmd init function
function imgs_init
{
	#shopt -s extglob
	#shopt -s nullglob
	imgs_mode="custom"
}

# The cmd main function
function imgs_main
{
	imgs_modesel="${1:-custom}"
	for imgs_mode in "${imgs_modes[@]}"
	do
		if [[ "$imgs_mode" = "$imgs_modesel" ]]
		then
			shift
			"imgs_$imgs_mode" "$@"
		fi
	done
	cmd_error "unknown mode"
}

# The cmd fields
cmd_package="[@]pkg[@]"
cmd="imgs"
cmd_name="images"
cmd_version="[@]pkgversion[@]"
cmd_description="Images Wizard"
cmd_explanation="images is a program that fetches and/or manipulates groups of images. imgs fetches google images, unify groups to sizes and builds slideshows."
cmd_license="[@]pkglicense[@]"
cmd_homepage="[@]pkghomepage[@]"
cmd_author="[@]pkgauthor[@]"
cmd_blog="[@]pkgblog[@]"
cmd_email="[@]pkgemail[@]"
cmd_usage="$cmd [OPTIONS] [MODE] [-- MODEOPTIONS]"
cmd_options=("/l/list/list modes/imgs_option_list/")
cmd_examples=("$cmd custom -- linux 50 320x240")
cmd_extrahelp="By default works in custom mode. Respect the terms of use of online services."
cmd_extranotes="Don't Fetch Useless Stuff, Be Clever. Don't Abuse Services, It's not funny, Be Nice. Development Getting Out Of Google Services. For more information, check documentation."
cmd_init="imgs_init"
cmd_main="imgs_main"

cmd_datadir="[@]pkgdatadir[@]"

# The cmd environment
source "$cmd_datadir/cmd.sh"
