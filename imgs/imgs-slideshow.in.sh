#! /usr/bin/env bash

# Relies in ImageMagick's *convert*
# November 22nd, 2013, Juan Manuel Borges Caño

(( $# == 0 )) && { echo "Usage: WidthxHeight Images ... SlideshowProduct.gif"; exit 1; }

size="$1"
slideshow="${@:$#}"

unification="$(imgs-unify "${@:1:$#-1}")"
echo "$unification"

convert -alpha off -scale "$size"\! -delay 50 -loop 0 "$unification"/* "$slideshow"
echo "$slideshow"
