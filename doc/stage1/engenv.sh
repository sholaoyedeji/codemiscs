# to speech
output=""

# dict
function d { output=$(dict -d wn "$1" | tail -n +5); echo "$output"; }

# speech
function s { echo "$output" | tr "[]" "()" | festival --tts; }

# translate
function t { output="$1"; tw en-es "$1"; }

# translate exactly
function x { output="$1"; tw -x en-es "$1"; }

# google
function g { output="$1"; tw gt.en-es "$1"; }

# yahoo
#function y { output="$1"; tw yb.en-es "$1"; }

# freetranslation
#function f { output="$1"; tw ft.en-es "$1"; }

# randword
function r
{
	file="/usr/share/dict/words"
	output=""
	while [[ -z "$output" ]]
	do
		word="$(shuf -n 1 "$file")"
		output="$(dict -d wn "$word" 2>/dev/null | tail -n +5)"
	done
	echo "$output"
}
