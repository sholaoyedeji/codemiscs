#! /usr/bin/env bash

# tw-config-gnome-helper: translate word config gnome helper script
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
