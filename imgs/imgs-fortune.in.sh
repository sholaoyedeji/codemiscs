#! /usr/bin/env bash

# November 22nd, 2013, Juan Manuel Borges Caño

word="$(shuf /usr/share/dict/words | head -1)"
size="${1:-320x240}"
count="${2:-100}"

echo "$word"
source=$(imgs-fetch-google "$word" "$count")
echo "$source"
imgs-slideshow "$size" "$source"/* "$word.gif"
