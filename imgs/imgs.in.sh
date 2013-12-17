#! /usr/bin/env bash

# imgs: fetch and manipulate images
# Copyright (C) 2013 Juan Manuel Borges Caño

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

shopt -s extglob

# The --fetch option
function imgs_fetch_google
{
	# Tweaked http://sam.nipl.net/code/nipl-tools/bin/google-images to be silent, and elegant
	# November 22nd, 2013, Juan Manuel Borges Caño

	[ $# = 0 ] && cmd_error "Usage: query count parallel safe opts timeout tries agent1 agent2"

	query=$1 count=${2:-100} parallel=${3:-10} safe=$4 opts=$5 timeout=${6:-10} tries=${7:-2} agent1=${8:-Mozilla/5.0 (X11; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0} agent2=${9:-Googlebot-Image/1.0}

	query_esc=`perl -e 'use URI::Escape; print uri_escape($ARGV[0]);' "$query"`
	dir=`echo "$query_esc" | sed 's/%20/-/g'`-`date +%s`; mkdir "$dir" || exit 2; cd "$dir"
	url="http://www.google.com/search?tbm=isch&safe=$safe&tbs=$opts&q=$query_esc" procs=0
	echo >.URL "$url" ; for A; do echo >>.args "$A"; done

	htmlsplit() { tr '\n\r \t' ' ' | sed 's/</\n</g; s/>/>\n/g; s/\n *\n/\n/g; s/^ *\n//; s/ $//;'; }

	for start in `seq 0 100 $[$count-1]`; do wget --quiet -U"$agent1" -T"$timeout" --tries="$tries" -O- "$url&start=$start" | htmlsplit; done | perl -ne 'use HTML::Entities; /^<a .*?href="(.*?)"/ and print decode_entities($1), "\n";' | grep '/imgres?' | perl -ne 'use URI::Escape; ($ref, $img) = map { uri_unescape($_) } /imgrefurl=(.*?)&imgurl=(.*?)&/; $ext = $img; for ($ext) { s,.*[/.],,; s/[^a-z0-9].*//i; $_ ||= "img"; } $save = sprintf("%04d.$ext", ++$i); print join("\t", $save, $img, $ref), "\n";' | tee -a .images.tsv | while IFS=$'\t' read -r save img ref; do wget --quiet -U"$agent2" -T"$timeout" --tries="$tries" --referer="$ref" -O "$save" "$img" || rm "$save" & procs=$[$procs + 1]; [ $procs = $parallel ] && { wait; procs=0; }; done

	wait

	echo "$dir"
}

# The --unify option
function imgs_unify
{
	# Relies in ImageMagick's *convert*
	# November 22nd, 2013, Juan Manuel Borges Caño

	(( $# == 0 )) && cmd_error "Usage: WidthxHeight Images ..."

	images=(); for file in "${@:2:$#}"; do [[ "$(file -bi "$file" | cut -d'/' -f1)" == "image" ]] && images=( "${images[@]}" "$file" ); done
	size="$1"

	unification=$(mktemp -d "Unification-$size-XXXXXXXXXX")
	for i in ${!images[@]}; do convert -scale "$size"\! "${images[i]}" "$unification/$(printf "%.10i" "$i").png"; done

	echo "$unification"
}

# The --slideshow option
function imgs_slideshow
{
	tw_synonyms=0
	# Relies in ImageMagick's *convert*
	# November 22nd, 2013, Juan Manuel Borges Caño

	(( $# == 0 )) && cmd_error "Usage: WidthxHeight Images ... SlideshowProduct.gif"

	size="$1"
	slideshow="${@:$#}"

	unification="$(imgs-unify "${@:1:$#-1}")"
	echo "$unification"

	convert -alpha off -scale "$size"\! -delay 50 -loop 0 "$unification"/* "$slideshow"
	echo "$slideshow"
}

# The --fortune option
function imgs_fortune
{
	# November 22nd, 2013, Juan Manuel Borges Caño

	size="${1:-320x240}"
	count="${2:-100}"
	word="${3:-$(shuf /usr/share/dict/words | head -1)}"

	echo "$word"
	source=$(imgs_fetch_google "$word" "$count")
	echo "$source"
	imgs_slideshow "$size" "$source"/* "$word.gif"
}

# ... and imgs, the program itself

# The cmd init function
function imgs_init
{
	shopt -s extglob
	shopt -s nullglob
}

# The cmd main function
function imgs_main
{
	imgs_fortune "$@"
}

# The cmd fields
cmd="imgs"
cmd_name="images"
cmd_description="fetch & manipulate images"
cmd_explanation="images is a program that fetches and/or manipulates groups of images. imgs fetches google images, unify groups to sizes and builds slideshows."
cmd_version="[@]pkgversion[@]"
cmd_author="[@]pkgauthor[@]"
cmd_bugreport="[@]pkgbugreport[@]"
cmd_homepage="[@]pkghomepage[@]"
cmd_usage="$cmd [OPTIONS] [DICTIONARY] [TERM]"
cmd_examples=("$cmd 320x240 100 linux")
cmd_options=("/f/fetch/fetch google images/imgs_fetch_google/" "/u/unify/unify images/imgs_unify/" "/s/slideshow/slideshow images set/imgs_slideshow/" "/f/fortune/fetch, unify and slideshow terms/imgs_fortune/")
cmd_extrahelp="By default $cmd, acts in fortune mode. Respect the terms of use of online services."
cmd_extranotes="For more information, check man documentation."
cmd_init="imgs_init"
cmd_main="imgs_main"

cmd_datadir="[@]pkgdatadir[@]"

# The cmd environment
source "$cmd_datadir/cmd.sh"
