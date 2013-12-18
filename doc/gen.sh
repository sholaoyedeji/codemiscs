#! /usr/bin/env bash
for command in cmd mkproject mythes tw rf imgs typewriter colorize 
do
	file="${command}.in.man"
	echo "Generating $file"
	$command --man > "$file"
done
