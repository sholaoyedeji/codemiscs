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
#   |                 translate word config klipper script                  |
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

read -p "Please, select language pair based on \`tw --list\` (example: en-es): " tw_langpair
read -p "Enable extra english addons? (y/n):" tw_english

klipperrc="$HOME/.kde/share/config/klipperrc"
tw_action=$(($(grep "Number of Actions=" "$klipperrc" | cut -d'=' -f2)))
echo "Linguistics action will be: $tw_action."
tw_actions=$((tw_action + 1))

if [[ $tw_english = "y" ]]
then tw_commands=9
else tw_commands=4
fi
echo "Number of commands will be: $tw_commands."

echo "Klipper number of actions will be: $tw_actions."

tw_general=$(grep -n "^\[General\]$" "$klipperrc" | cut -d':' -f1)
tw_lines=$(wc -l < "$klipperrc")
echo "Linguistics action will be inserted before $klipperrc line: $tw_general."

read -p "Proceed? (y/n)"
[[ $REPLY = "n" ]] && exit

{
head -n $(($tw_general - 1)) "$klipperrc"

cat <<EOF
[Action_$tw_action]
Automatic=true
Description=Linguistics
Number of commands=$tw_commands
Regexp=.*

[Action_$tw_action/Command_0]
Commandline[\$e]=kdialog --caption "Translate Word" --title "$tw_langpair" --msgbox "\$\$(tw -x -y $tw_langpair "%s")"
Description=Translate $tw_langpair Locally
Enabled=true
Icon=
Output=0

[Action_$tw_action/Command_1]
Commandline[\$e]=kdialog --caption "Translate Word" --title "$tw_langpair" --msgbox "\$\$(tw -y $tw_langpair "%s")"
Description=Translate $tw_langpair Wild Locally
Enabled=true
Icon=
Output=0

[Action_$tw_action/Command_2]
Commandline[\$e]=kdialog --caption "Translate Word" --title "$tw_langpair" --msgbox "\$\$(tw gt.$tw_langpair "%s")"
Description=Translate $tw_langpair Online Google
Enabled=true
Icon=
Output=0

[Action_$tw_action/Command_3]
Commandline[\$e]=kdialog --caption "Translate Word" --title "$tw_langpair" --msgbox "\$\$(tw ft.$tw_langpair "%s")"
Description=Translate $tw_langpair Online FreeTranslation
Enabled=true
Icon=
Output=0

EOF

if [[ $tw_english == "y" ]]
then
cat <<EOF
[Action_$tw_action/Command_4]
Commandline[\$e]=kdialog --caption "WordNet" --title "English" --msgbox "\$\$(dict -h localhost -d wn "%s" | tail -n +5)"
Description=Define English Locally
Enabled=true
Icon=
Output=0

[Action_$tw_action/Command_5]
Commandline[\$e]=kdialog --caption "WordNet" --title "English" --msgbox "\$\$(dict -d wn "%s" | tail -n +5)"
Description=Define English Online
Enabled=true
Icon=
Output=0

[Action_$tw_action/Command_6]
Commandline[\$e]=echo "%s" | festival --tts
Description=Speak English
Enabled=true
Icon=
Output=0

[Action_$tw_action/Command_7]
Commandline[\$e]=dict -h localhost -d wn "%s" | tail -n +5 | tr "[]" "()" | festival --tts
Description=Define And Speak English Locally
Enabled=true
Icon=
Output=0

[Action_$tw_action/Command_8]
Commandline[\$e]=dict -d wn "%s" | tail -n +5 | tr "[]" "()" | festival --tts
Description=Define And Speak English Online
Enabled=true
Icon=
Output=0

EOF
fi

tail -n $((tw_lines - tw_general + 1)) "$klipperrc"
} | sed -e "s/Number of Actions=.*$/Number of Actions=$tw_actions/" > "/tmp/tw-config-klipperrc"
cp "/tmp/tw-config-klipperrc" "$klipperrc"

echo "$klipperrc modified."
