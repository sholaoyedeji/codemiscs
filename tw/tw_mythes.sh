# tw_mythes: tw mythes engine
# Copyright (C) 2007-2013 Juan Manuel Borges Caño

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

function tw_my_name
{
	printf "%s\n"  "mythes"
}

function tw_my_shortcut
{
	printf "%s\n"  "my"
}

function tw_my_list
{
	printf "%s\n" \
	"bg" \
	"ca" \
	"cs" \
	"da" \
	"de" \
	"el" \
	"en" \
	"es" \
	"fr" \
	"ga" \
	"hu" \
	"it" \
	"lb" \
	"lv" \
	"mi" \
	"nb" \
	"ne" \
	"nl" \
	"nn" \
	"pl" \
	"pt" \
	"ro" \
	"ru" \
	"sk" \
	"sl" \
	"sv" \
	"uk"
}

# This helps adapting naming scheme
function tw_my_language
{
	twp_language=""
	case "$1" in
		"bg") twp_language="bg_BG";;
		"ca") twp_language="ca_ES";;
		"cs") twp_language="cs_CZ";;
		"da") twp_language="da_DK";;
		"de") twp_language="de_DE";;
		"el") twp_language="el_GR";;
		"en") twp_language="en_US";;
		"es") twp_language="es_ES";;
		"fr") twp_language="fr_FR";;
		"ga") twp_language="ga_IE";;
		"hu") twp_language="hu_HU";;
		"it") twp_language="it_IT";;
		"lb") twp_language="lb_LU";;
		"lv") twp_language="lv_LV";;
		"mi") twp_language="mi_NZ";;
		"nb") twp_language="nb_NO";;
		"ne") twp_language="ne_NP";;
		"nl") twp_language="nl_NL";;
		"nn") twp_language="nn_NO";;
		"pl") twp_language="pl_PL";;
		"pt") twp_language="pt_PT";;
		"ro") twp_language="ro_RO";;
		"ru") twp_language="ru_RU";;
		"sk") twp_language="sk_SK";;
		"sl") twp_language="sl_SI";;
		"sv") twp_language="sv_SE";;
		"uk") twp_language="en_GB";;
	esac
	[[ -n "$twp_language" ]] && printf "%s\n"  "$twp_language"
}

# This helps adapting antonym
function twp_my_antonym
{
	twp_antonym=""
	case "$1" in
		"bg") twp_antonym="антоним";;
		"ca") twp_antonym="antònim";;
		"cs") twp_antonym="antonymum";;
		"da") twp_antonym="antonym";;
		"de") twp_antonym="antonym";;
		"el") twp_antonym="αντίθετο";;
		"en") twp_antonym="antonym";;
		"es") twp_antonym="antónimo";;
		"fr") twp_antonym="antonyme";;
		"ga") twp_antonym="antonym";;
		"hu") twp_antonym="antonímia";;
		"it") twp_antonym="antonimo";;
		"lb") twp_antonym="antonym";;
		"lv") twp_antonym="antonīms";;
		"mi") twp_antonym="antonym";;
		"nb") twp_antonym="antonym";;
		"ne") twp_antonym="antonym";;
		"nl") twp_antonym="antoniem";;
		"nn") twp_antonym="antonym";;
		"pl") twp_antonym="antonim";;
		"pt") twp_antonym="antônimo";;
		"ro") twp_antonym="antonim";;
		"ru") twp_antonym="антоним";;
		"sk") twp_antonym="antonymum";;
		"sl") twp_antonym="protipomenka";;
		"sv") twp_antonym="antonym";;
		"uk") twp_antonym="антонім";;
	esac
	[[ -n "$twp_antonym" ]] && printf "%s\n"  "$twp_antonym"
}

# This does synonyms
function tw_mythes
{
	# This adapts tw naming scheme to engine naming scheme
	twp_language="$(tw_my_language "$1")"
	twp_idx="/usr/share/mythes/th_${twp_language}_v2.idx"
	twp_dat="/usr/share/mythes/th_${twp_language}_v2.dat"

	# This performs the translation
	twp_output="$(mythes-raw "$twp_idx" "$twp_dat" <(printf "%s\n" "$2") 2> /dev/null)"
	if (( "$?" == "0" ))
	then
		twp_encoding="$(printf "%s\n" "$twp_output" | head -n 1)"
		printf "%s\n" "$twp_output" | tail -n +2 | sort -u | grep -vi ' ('"$(twp_my_antonym "$1")"')' | sed -e 's/ ([^)]*)$//g'
	fi
}
