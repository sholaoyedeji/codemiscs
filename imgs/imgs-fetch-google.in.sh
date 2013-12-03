#! /usr/bin/env bash

# Tweaked http://sam.nipl.net/code/nipl-tools/bin/google-images to be silent, and elegant
# November 22nd, 2013, Juan Manuel Borges Caño

[ $# = 0 ] && { prog=`basename "$0"`; echo -e >&2 "usage: $prog query count parallel safe opts timeout tries agent1 agent2\ne.g. : $prog ostrich\n$prog nipl 100 20 on isz:l,itp:clipart 5 10"; exit 2; }

query=$1 count=${2:-100} parallel=${3:-10} safe=$4 opts=$5 timeout=${6:-10} tries=${7:-2} agent1=${8:-Mozilla/5.0 (X11; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0} agent2=${9:-Googlebot-Image/1.0}

query_esc=`perl -e 'use URI::Escape; print uri_escape($ARGV[0]);' "$query"`
dir=`echo "$query_esc" | sed 's/%20/-/g'`-`date +%s`; mkdir "$dir" || exit 2; cd "$dir"
url="http://www.google.com/search?tbm=isch&safe=$safe&tbs=$opts&q=$query_esc" procs=0
echo >.URL "$url" ; for A; do echo >>.args "$A"; done
htmlsplit() { tr '\n\r \t' ' ' | sed 's/</\n</g; s/>/>\n/g; s/\n *\n/\n/g; s/^ *\n//; s/ $//;'; }

for start in `seq 0 100 $[$count-1]`; do wget --quiet -U"$agent1" -T"$timeout" --tries="$tries" -O- "$url&start=$start" | htmlsplit; done | perl -ne 'use HTML::Entities; /^<a .*?href="(.*?)"/ and print decode_entities($1), "\n";' | grep '/imgres?' | perl -ne 'use URI::Escape; ($ref, $img) = map { uri_unescape($_) } /imgrefurl=(.*?)&imgurl=(.*?)&/; $ext = $img; for ($ext) { s,.*[/.],,; s/[^a-z0-9].*//i; $_ ||= "img"; } $save = sprintf("%04d.$ext", ++$i); print join("\t", $save, $img, $ref), "\n";' | tee -a .images.tsv | while IFS=$'\t' read -r save img ref; do wget --quiet -U"$agent2" -T"$timeout" --tries="$tries" --referer="$ref" -O "$save" "$img" || rm "$save" & procs=$[$procs + 1]; [ $procs = $parallel ] && { wait; procs=0; }; done

wait

echo "$dir"