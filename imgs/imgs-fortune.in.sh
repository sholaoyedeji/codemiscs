#! /usr/bin/env bash

# November 22nd, 2013, Juan Manuel Borges Caño

size="${1:-320x240}"
count="${2:-100}"
word="${3:-$(shuf /usr/share/dict/words | head -1)}"

echo "$word"
source=$(imgs-fetch-google "$word" "$count")
echo "$source"
imgs-slideshow "$size" "$source"/* "$word.gif"
