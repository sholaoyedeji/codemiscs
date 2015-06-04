mythes is a command that shows synonyms for a given word.


---


<h1>Manual</h1>
```
MYTHES(1)                                   User Commands                                   MYTHES(1)



NAME
       mythes - Synonyms Mythes Interface

SYNOPSIS
       mythes [OPTIONS] [DICTIONARY] [TERM]

EXAMPLE
       mythes en hello

DESCRIPTION
       mythes is a command that shows synonyms for a given word.

       Mandatory arguments for long options are mandatory for short options too.

       -l, --list
              list available dictionaries

       -p, --spelling
              check the spelling grammar

       -k, --speak
              speak the text

       -v, --version
              show the program version

       -v, --variable=VARIABLE
              show a program variable

       -h, --help
              show the program help

       -m, --man
              show the program manual

       With no term, or when term is -, read standard input.

       The  available  --variable  VARIABLES  are:  package, name, version, description, explanation,
       license, homepage, author, email, social, blog, usage, options, examples,  extrahelp,  extran‐
       otes, month, year, day and timestamp.

       Execute 'bash -c "man <(mythes --man)"' to see the runtime manpage.

NOTES
       Machines Content. For more information, check documentation.

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



mythes 2014.06.07                          Monday July 2014                                 MYTHES(1)
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
mythes (mythes) by Juan Manuel Borges Caño licensed GPLv3+ (Monday July 2014)
Synonyms Mythes Interface
Usage: mythes [OPTIONS] [DICTIONARY] [TERM]
Example: mythes en hello

mythes is a command that shows synonyms for a given word.

Mandatory arguments for long options are mandatory for short options too:
  -l, --list                                    list available dictionaries
  -p, --spelling                                check the spelling grammar
  -k, --speak                                   speak the text
  -v, --version                                 show the program version
  -v, --variable=VARIABLE                       show a program variable
  -h, --help                                    show the program help
  -m, --man                                     show the program manual
With no term, or when term is -, read standard input.
The available --variable VARIABLES are: package, name, version, description, explanation, license, homepage, author, email, social, blog, usage, options, examples, extrahelp, extranotes, month, year, day and timestamp.
Execute 'bash -c "man <(mythes --man)"' to see the runtime manpage.

mythes (mythes) homepage: http://code.google.com/p/codemiscs.
mythes (mythes) author: Juan Manuel Borges Caño.
mythes (mythes) email: juanmabcmail@gmail.com.
mythes (mythes) social: http://plus.google.com/+JuanManuelBorgesCaño
mythes (mythes) blog: http://juanmabcblog.blogspot.com.
Machines Content. For more information, check documentation.
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
Simple:
```
$ mythes en hello
greeting
hi
how-do-you-do
howdy
hullo
salutation

$ mythes en goodbye
adieu
adios
arrivederci
auf wiedersehen
au revoir
bye
bye-bye
cheerio
farewell
goodby
good-by
good-bye
good day
sayonara
so long
word of farewell

$ mythes es saludo
abrazo
acatamiento
aceptación
acogida
admisión
adulación
aplauso
aprobación
arrodillamiento
besalamano
besamanos
bienllegada
bienvenida
brindis
cabezada
coba
congratulación
consentimiento
convite
cortesía
cumplido
cumplimiento
dedicación
dedicatoria
elogio
enhorabuena
esquela
éxito
felicitación
genuflexión
halago
inclinación
invitación
lisonja
nota
ofrecimiento
parabién
pláceme
popularidad
prosternación
recepción
recibimiento
reverencia
venia
zalamería
zalema
```

Wide Language Support:
```
$ mythes --list
bg
ca
cs
da
de
el
en
es
fr
ga
hu
it
lb
lv
mi
nb
ne
nl
nn
pl
pt
ro
ru
sk
sl
sv
uk
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