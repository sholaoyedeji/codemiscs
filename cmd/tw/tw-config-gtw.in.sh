#! /usr/bin/env bash

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
#   |              translate word config gnome helper script                |
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

[[ -e gtw ]] && { echo "File ./gtw already exists."; exit 0; }

read -p "Please, select language pair based on \`tw --list\` (example: en-es): " tw_langpair

{
cat <<EOF
#! /usr/bin/env bash

# gtw: translate word gnome helper script

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

selection="\$(gpaste get 0)"
[[ -z \$selection ]] && selection="\$(xsel -p)"
# selection="\$(xsel -p)"
[[ -z \$selection ]] && selection="\$(xsel -s)"
[[ -z \$selection ]] && selection="\$(xsel -b)"
[[ -z \$selection ]] && exit 0

translation="\$(printf "%s\\n" "\$selection" | sed -e 's/  \+/ /g' | tw gt.en-es | fmt -2048)"
# translation="\$(tw "gt.$tw_langpair" "\$selection")"

zenity --title "Translate Word" --notification --text "\$translation" --timeout 10
# zenity --title "Translate Word" --info --text "\$translation"
EOF
} > ./gtw
chmod +x gtw

echo "File ./gtw created. Place it somewhere in your path (/usr/local/bin for instance) (or call it absolutely) and assign a keyboard action like meta-t for selection/clipboard notification translation."
