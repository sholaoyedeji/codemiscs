translate word is a command that translates words into different languages. tw uses internal dictionaries, and contacts online to the Google Translation and the FreeTranslation engines.


---


<h1>Manual</h1>
```
TW(1)                                       User Commands                                       TW(1)



NAME
       tw - Human Language Translator

SYNOPSIS
       tw [OPTIONS] [DICTIONARY] [TERM]

EXAMPLE
       tw en-es hello

DESCRIPTION
       translate  word  is a command that translates words into different languages. tw uses internal
       dictionaries, and contacts online to the Google Translation and the FreeTranslation engines.

       Mandatory arguments for long options are mandatory for short options too.

       -l, --list
              list available dictionaries

       -s, --shortcuts
              list available dictionaries shortcuts

       -x, --exact
              perform an exact match

       -y, --synonyms
              perform a synonym triangulation

       -p, --spelling
              check the spelling grammar

       -k, --speak
              speak the text

       -d, --disable-logging
              disable logging of failure terms

       -v, --version
              show the program version

       -v, --variable=VARIABLE
              show a program variable

       -h, --help
              show the program help

       -m, --man
              show the program manual

       With no term, or when term is -, read standard input. Create ~/.tw directory to enable caching
       and logging (mkdir ~/.tw). For straight synonyms, check mythes command.

       The  available  --variable  VARIABLES  are:  package, name, version, description, explanation,
       license, homepage, author, email, social, blog, usage, options, examples,  extrahelp,  extran‐
       otes, month, year, day and timestamp.

       Execute 'bash -c "man <(tw --man)"' to see the runtime manpage.

NOTES
       Machines Content, Respect terms of online services. For more information, check documentation.

HOMEPAGE
       Main project page at http://code.google.com/p/codemiscs.

AUTHOR
       Programmed by Juan Manuel Borges Caño.

EMAIL
       Thank, Contact, Follow through juanmabcmail@gmail.com.

SOCIAL
       Interact with http://plus.google.com/+JuanManuelBorgesCaño

SUPPORT
       Support through Paypal, Patreon, Flattr, Western Union, BitCoin, ...

COPYRIGHT
       Copyright © 2014 Juan Manuel Borges Caño.

       This software is licensed and under the terms of the GPLv3+ License.  There is NO WARRANTY, to
       the extent permitted by law.



tw 2014.06.07                              Monday July 2014                                     TW(1)
```

<table width='100%'>
<blockquote><tr>
<blockquote><td align='center'>
<blockquote><h1>Awesome Code, Awesome Results</h1>
</blockquote></td>
</blockquote></tr>
</table></blockquote>


---


<table width='100%'>
<blockquote><tr>
<blockquote><td align='center'>
<blockquote><h3>Ad Supporting CodeMiscs Development</h3></blockquote></blockquote></blockquote>

<blockquote><wiki:gadget url="http://goo.gl/Uql18" width="728" height="90" border="1" up_ad_client="1499394790009918" up_ad_slot="0061131168" up_ad_width="728" up_ad_height="90" /></blockquote>

<blockquote><h3>Ad Supporting CodeMiscs Development</h3>
</blockquote><blockquote></td>
</blockquote><blockquote></tr>
</table></blockquote>


---


<h1>Help</h1>
```
tw (translate word) by Juan Manuel Borges Caño licensed GPLv3+ (Monday July 2014)
Human Language Translator
Usage: tw [OPTIONS] [DICTIONARY] [TERM]
Example: tw en-es hello

translate word is a command that translates words into different languages. tw uses internal dictionaries, and contacts online to the Google Translation and the FreeTranslation engines.

Mandatory arguments for long options are mandatory for short options too:
  -l, --list                                    list available dictionaries
  -s, --shortcuts                               list available dictionaries shortcuts
  -x, --exact                                   perform an exact match
  -y, --synonyms                                perform a synonym triangulation
  -p, --spelling                                check the spelling grammar
  -k, --speak                                   speak the text
  -d, --disable-logging                         disable logging of failure terms
  -v, --version                                 show the program version
  -v, --variable=VARIABLE                       show a program variable
  -h, --help                                    show the program help
  -m, --man                                     show the program manual
With no term, or when term is -, read standard input. Create ~/.tw directory to enable caching and logging (mkdir ~/.tw). For straight synonyms, check mythes command.
The available --variable VARIABLES are: package, name, version, description, explanation, license, homepage, author, email, social, blog, usage, options, examples, extrahelp, extranotes, month, year, day and timestamp.
Execute 'bash -c "man <(tw --man)"' to see the runtime manpage.

tw (translate word) homepage: http://code.google.com/p/codemiscs.
tw (translate word) author: Juan Manuel Borges Caño.
tw (translate word) email: juanmabcmail@gmail.com.
tw (translate word) social: http://plus.google.com/+JuanManuelBorgesCaño
tw (translate word) blog: http://juanmabcblog.blogspot.com.
Machines Content, Respect terms of online services. For more information, check documentation.
```

<table width='100%'>
<blockquote><tr>
<blockquote><td align='center'>
<blockquote><h1>Awesome Code, Awesome Results</h1>
</blockquote></td>
</blockquote></tr>
</table></blockquote>


---


<table width='100%'>
<blockquote><tr>
<blockquote><td align='center'>
<blockquote><h3>Ad Supporting CodeMiscs Development</h3></blockquote></blockquote></blockquote>

<blockquote><wiki:gadget url="http://goo.gl/Uql18" width="728" height="90" border="1" up_ad_client="1499394790009918" up_ad_slot="0061131168" up_ad_width="728" up_ad_height="90" /></blockquote>

<blockquote><h3>Ad Supporting CodeMiscs Development</h3>
</blockquote><blockquote></td>
</blockquote><blockquote></tr>
</table></blockquote>


---


<h1>Use Cases</h1>
Machines Content, Respect the terms of online services.

<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/TranslateWord/LanguageCatalyst.png' />
</p>

Local Dictionaries Technology:

```
$ tw en-es hello
hola
```

Online Translation Providers:

```
$ tw translate.google.com.en-es Salute
Saludo
$ tw gt.en-es Salute
Saludo

$ tw www.freetranslation.com.en-es Salute
Saludo
$ tw ft.en-es Salute
Saludo
```

Phrases Support:

```
$ tw translate.google.com.en-es "This is a demonstration."
Esta es una demostración.
$ tw gt.en-es "This is a demonstration."
Esta es una demostración.
```

Wide Language Support:

```
$ tw translate.google.com.en-fr "This is a demonstration."
Ceci est une démonstration.
$ tw gt.en-fr "This is a demonstration."
Ceci est une démonstration.

$ tw translate.google.com.en-ru "This is a demonstration."
Это демонстрация.
$ tw gt.en-ru "This is a demonstration."
Это демонстрация.

$ tw translate.google.com.en-it "This is a demonstration."
Questa è una dimostrazione.
$ tw gt.en-it "This is a demonstration."
Questa è una dimostrazione.

$ tw translate.google.com.en-ja "This is a demonstration."
これはデモンストレーションです。
$ tw gt.en-ja "This is a demonstration."
これはデモンストレーションです。
```

Engines Distinctions:

```
$ tw --list | grep en-es
share.en-es
cache.en-es
local.en-es
www.freetranslation.com.en-es
translate.google.com.en-es
```

Engines Abreviations:

```
$ tw --shortcuts
share = sh
cache = ca
local = lo
www.freetranslation.com = ft
translate.google.com = gt
```

Graphical Integration With Copy & Paste Buffer Managers:

```
XBindKeys
GNOME GPaste
KDE Klipper
```

Language Station:

```
alias show=cat

*$* show /usr/local/bin/spell
#! /usr/bin/env bash
aspell --lang=en pipe <<< "$@"| tail -n +2 | head -n +1

*$ spell studing*
& studing 45 0: studding, studying, stating, striding, stuffing, duding, siding, situating, tiding, sting, standing, stunting, scudding, sliding, sounding, stubbing, stunning, styling, suturing, starting, stetting, studio, string, seeding, sodding, student, sanding, sending, spading, staging, staking, staling, staring, staving, staying, stewing, stoking, stoning, storing, stowing, studied, studies, studios, studding's, studio's

*$* show /usr/local/bin/translate 
#! /usr/bin/env bash
{
        {
                tw -x -y en-es "$@"
                tw gt.en-es "$@"
                tw ft.en-es "$@"
        } 2> /dev/null | sed -e '/^$/d' | sort -u | colorize info
        {
                mythes en "$@"
        } 2> /dev/null | sed -e '/^$/d' | colorize warning
} | paste -s -d'|'

*$ translate studying*
*estudiar*|*lectura*|*leyendo*|perusal|perusing|poring over|reading

*$* show /usr/local/bin/define 
#! /usr/bin/env bash
dict -d wn "$@"| colorize info

*$ define studying*
1 definition found

From WordNet (r) 3.0 (2006) [wn]:

  studying
      n 1: reading carefully with intent to remember [syn: {perusal},
           {perusing}, {poring over}, {studying}]

*$* show  /usr/local/bin/pronounce
#! /usr/bin/env bash
festival --tts <<< "$@"

*$ pronounce studying*
((( * )))

*$* show /usr/local/bin/traduce 
#! /usr/bin/env bash
{
        tw -x -y es-en "$@"
        tw gt.es-en "$@"
        tw ft.es-en "$@"
} 2> /dev/null | sed -e '/^$/d' | sort -u | colorize info
{
        mythes es "$@"
} 2> /dev/null | sed -e '/^$/d' | colorize warning

*$ traduce estudiando*
studying

*$* show /usr/local/bin/language
#! /usr/bin/env bash
{
        echo "Spelling" | colorize bold
        spell "$@"
        echo "Translation" | colorize bold
        translate "$@"
        echo "Definition" | colorize bold
        define "$@"
        echo "(((Pronunciation)))" | colorize bold
        pronounce "$@"
} | sed -e '/^$/d'

*$ language studying*
Spelling
*
Translation
estudiar|lectura|leyendo|perusal|perusing|poring over|reading
Definition
  studying
      n 1: reading carefully with intent to remember [syn: {perusal},
           {perusing}, {poring over}, {studying}]
(((Pronunciation)))
```
<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/TranslateWord/LanguageStudying.png' />
</p>

<table width='100%'>
<blockquote><tr>
<blockquote><td align='center'>
<blockquote><h1>Awesome Code, Awesome Results</h1>
</blockquote></td>
</blockquote></tr>
</table></blockquote>


---


<table width='100%'>
<blockquote><tr>
<blockquote><td align='center'>
<blockquote><h3>Ad Supporting CodeMiscs Development</h3></blockquote></blockquote></blockquote>

<blockquote><wiki:gadget url="http://goo.gl/Uql18" width="728" height="90" border="1" up_ad_client="1499394790009918" up_ad_slot="0061131168" up_ad_width="728" up_ad_height="90" /></blockquote>

<blockquote><h3>Ad Supporting CodeMiscs Development</h3>
</blockquote><blockquote></td>
</blockquote><blockquote></tr>
</table></blockquote>


---


<table width='100%' align='center'>
<tr>
<td>
<ul><li><a href='Command.md'>Command (cmd): Command Wrapper</a>
</li><li><a href='MakeProject.md'>Make Project (mkproject): Project Generator</a>
</li><li><a href='Mythes.md'>Mythes (mythes): Synonyms Mythes Interface</a>
</li><li><a href='TranslateWord.md'>Translate Word (tw): Human Language Translator</a>
</li><li><a href='ReadFeed.md'>Read Feed (rf): Feed Reader</a>
</li><li><a href='Images.md'>Images (imgs): Images Wizard</a>
</li><li><a href='Typewrite.md'>Typewrite (typewrite): Slowed Down Echoer</a>
</li><li><a href='ColorizeInput.md'>Colorize Input (colorize): Input Tinter</a>
</li><li><a href='ShellShow.md'>Shell Show (show): Show Fun</a>
</li><li><a href='ToneBeep.md'>Tone Beep (tonize): Internal Speaker Tone Beeper</a>
</li><li><a href='StatusReport.md'>Status Report (status): Status Reporter</a>
</td>
<td>
<table width='100%'>
</li></ul><blockquote><tr>
<blockquote><td align='center'>
<blockquote><h2>codemiscs (Code Miscellaneous) licensed GPLv3</h2>
<h2>by Juan Manuel Borges Caño</h2>
<p>
< <a href='http://code.google.com/p/codemiscs'>Homepage</a> ><br>
</p>
<p>
< <a href='http://code.google.com/p/codemiscs/wiki/'>Wiki</a> ><br>
</p>
<p>
< <a href='mailto:juanmabcmail@gmail.com'>Mail</a> ><br>
</p>
<p>
<a href='http://plus.google.com/+JuanManuelBorgesCaño'>Social</a>
</p>
<p>
< <a href='http://juanmabcblog.blogspot.com'>Blog</a> ><br>
</p>
</blockquote></td>
</blockquote></tr>
</table>
</td>
</tr>
</table></blockquote>

<table width='100%'>
<blockquote><tr>
<blockquote><td align='center'>
<blockquote><h2>You can:</h2>
<p>
Thank, Comment, Follow, Contact Through Mail<br>
</p>
<p>
<strong>and</strong>
</p>
<p>
Support Through PayPal, Patreon, Flattr, Western Union & BitCoin<br>
</p>
<h1>:-)</h1>
</blockquote></td>
</blockquote></tr>
</table></blockquote>

<table width='100%'>
<blockquote><tr>
<blockquote><td align='center'>
<blockquote><p>
Copyright (C) 2007 - 2014<br>
</p>
<p>
<a href='http://plus.google.com/+JuanManuelBorgesCaño'>Juan Manuel Borges Caño</a>
</p>
</blockquote></td>
</blockquote></tr>
</table>