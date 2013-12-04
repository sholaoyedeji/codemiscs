#! /usr/bin/env bash

# December 4th, 2013, Juan Manuel Borges Caño
sed \
	-e "s/\([[:digit:]]\+\)/$(tput setaf 4)\1$(tput sgr0)/g" \
	-e "s/\(GB\|MB\|KB\|[[:upper:]_]\{2,\}\|'[^']\+'\|\"[^\"]\+\"\|\`\`[^\']\+''\)/$(tput setaf 2)\1$(tput sgr0)/g" \
	-e "s/\(=\)\([?[:alnum:]_-.]\+\)/\1$(tput setaf 2)\2$(tput sgr0)/g" \
	-e "s/\([^[:alnum:]]\)\(-\{1,2\}[?[:alnum:]_-]\+\)\( \)\?\([?[:alnum:]_-]\+\)\?/\1$(tput setaf 5)\2$(tput sgr0)\3$(tput setaf 2)\4$(tput sgr0)/g" \
	-e "s/\([[:alnum:]_-]\+\)\+@\([[:alnum:]_-.]\+\)/$(tput setaf 1)\1$(tput sgr0)@$(tput setaf 4)\2$(tput sgr0)/g" \
	-e "s/\(http:\/\/\)\([^/]\+\)\([^[:blank:]]\+\)/$(tput setaf 1)\1$(tput sgr0)$(tput setaf 6)\2$(tput sgr0)$(tput setaf 4)\3$(tput sgr0)/g" \
	-e "s/\(Arguments\|arguments\|Options\|options\|Complete\|complete\|Help\|help\|Documentation\|documentation\|Mandatory\|mandatory\|Home Page\|home page\|Homepage\|Report\|report\)/$(tput setaf 3)\1$(tput sgr0)/g" \
	-
