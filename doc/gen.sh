#! /usr/bin/env bash
for command in cmd mkproject mythes tw rf imgs typewrite colorize show tonize status
do
	file="${command}.in.man"
	echo "Generating $file" | colorize info
	$command --man > "$file"
done
