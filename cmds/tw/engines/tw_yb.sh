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
#   |                        Yahoo Babelfish Plugin                         |
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

# Gone MSDN Bing, not installed.

function tw_yb_name
{
	printf "%s\n"  "babelfish.yahoo.com"
}

function tw_yb_shortcut
{
	printf "%s\n"  "yb"
}

function tw_yb_list
{
	printf "%s\n" \
	"de-en" \
	"de-fr" \
	"el-en" \
	"el-fr" \
	"en-de" \
	"en-el" \
	"en-es" \
	"en-fr" \
	"en-it" \
	"en-ja" \
	"en-ko" \
	"en-nl" \
	"en-pt" \
	"en-ru" \
	"en-zh" \
	"en-zt" \
	"es-en" \
	"es-fr" \
	"fr-de" \
	"fr-el" \
	"fr-en" \
	"fr-es" \
	"fr-it" \
	"fr-nl" \
	"fr-pt" \
	"it-en" \
	"it-fr" \
	"ja-en" \
	"ko-en" \
	"nl-en" \
	"nl-fr" \
	"pt-en" \
	"pt-fr" \
	"ru-en" \
	"zh-en" \
	"zh-zt" \
	"zt-en" \
	"zt-zh"
}

# This does AI translation
function tw_yb
{
	# This adapts tw naming scheme to engine naming scheme
	twp_language="$(printf "%s\n" "$tw_dict" | tr '-' '_')"

	# This performs the translation
	twp_data="$(printf "%s\n" "$tw_input" | curl -s --connect-timeout 300 --max-time 300 -A "Mozilla/5.0" --data-urlencode "ei=UTF-8" --data-urlencode "lp=${twp_language}" --data-urlencode "trtext@-" --data-urlencode "tt=urltext" --data-urlencode "intl=1" --data-urlencode "fr=bf-res" --data-urlencode "doit=done" --data-urlencode "btnTrTxt=Translate" http://babelfish.yahoo.com/translate_txt)"
	tw_output="$(printf "%s\n" "$twp_data" | xmllint --html --xpath '//div[@id="result"]' - 2> /dev/null | lynx -assume-charset="ISO-8859-1" -dump -stdin | sed -e 's/^[[:space:]][[:space:]][[:space:]]//')"
}
