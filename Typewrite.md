typewrite is a program that echoes slowly. typewrite reads a file or standard input and writes slowed down to standard output.


---


<h1>Manual</h1>
```
TYPEWRITE(1)                                User Commands                                TYPEWRITE(1)



NAME
       typewrite - Slowed Down Echoer

SYNOPSIS
       typewrite [OPTIONS] [FILE]

EXAMPLE
       echo text | typewrite

DESCRIPTION
       typewrite is a program that echoes slowly. typewrite reads a file or standard input and writes
       slowed down to standard output.

       Mandatory arguments for long options are mandatory for short options too.

       -c, --charsecs=CHARSECS
              set seconds per character

       -l, --linesecs=LINESECS
              set seconds per line

       -f, --fast
              type faster

       -s, --slow
              type slower

       -r, --scroll[=LINESECS]
              type scrolling

       -a, --all
              slow all characters

       -s, --sound
              play a sound while echoing

       -v, --version
              show the program version

       -v, --variable=VARIABLE
              show a program variable

       -h, --help
              show the program help

       -m, --man
              show the program manual

       By default slows only printable characters, at 0.05 seconds per character and 0.5 seconds  per
       line, and does not play sound. With no file, or when file is -, read standard input.

       The  available  --variable  VARIABLES  are:  package, name, version, description, explanation,
       license, homepage, author, email, social, blog, usage, options, examples,  extrahelp,  extran‐
       otes, month, year, day and timestamp.

       Execute 'bash -c "man <(typewrite --man)"' to see the runtime manpage.

NOTES
       For more information, check documentation.

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



typewrite 2014.06.07                       Monday July 2014                              TYPEWRITE(1)
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
typewrite (typewrite) by Juan Manuel Borges Caño licensed GPLv3+ (Monday July 2014)
Slowed Down Echoer
Usage: typewrite [OPTIONS] [FILE]
Example: echo text | typewrite 

typewrite is a program that echoes slowly. typewrite reads a file or standard input and writes slowed down to standard output.

Mandatory arguments for long options are mandatory for short options too:
  -c, --charsecs=CHARSECS                       set seconds per character
  -l, --linesecs=LINESECS                       set seconds per line
  -f, --fast                                    type faster
  -s, --slow                                    type slower
  -r, --scroll[=LINESECS]                       type scrolling
  -a, --all                                     slow all characters
  -s, --sound                                   play a sound while echoing
  -v, --version                                 show the program version
  -v, --variable=VARIABLE                       show a program variable
  -h, --help                                    show the program help
  -m, --man                                     show the program manual
By default slows only printable characters, at 0.05 seconds per character and 0.5 seconds per line, and does not play sound. With no file, or when file is -, read standard input.
The available --variable VARIABLES are: package, name, version, description, explanation, license, homepage, author, email, social, blog, usage, options, examples, extrahelp, extranotes, month, year, day and timestamp.
Execute 'bash -c "man <(typewrite --man)"' to see the runtime manpage.

typewrite (typewrite) homepage: http://code.google.com/p/codemiscs.
typewrite (typewrite) author: Juan Manuel Borges Caño.
typewrite (typewrite) email: juanmabcmail@gmail.com.
typewrite (typewrite) social: http://plus.google.com/+JuanManuelBorgesCaño
typewrite (typewrite) blog: http://juanmabcblog.blogspot.com.
For more information, check documentation.
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
<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/TypeWrite/TypeWriteHelp.gif' />
</p>

Simple:

```
$ cat file | typewrite
...

$ typewrite file
...
```
<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/TypeWrite/TypeWriteFile.gif' />
</p>

Customizable:

```
$ typewrite file --charsecs 1 --linesecs 2
...
```

Has Presets:

```
$ typewrite file --fast
...

$ typewrite file --slow
...

$ typewrite file --scroll
...
```
<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/TypeWrite/TypeWriteScroll.gif' />
</p>

Has An Audio Touch:

```
$ typewrite file --sound
...
```

Extends To External Commands:

```
$ rf slashdot | colorize strong | typewrite
```
<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/TypeWrite/TypeWriteRFSlashdot.gif' />
</p>

```
$ rf phoronix | colorize cool | typewrite
```
<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/TypeWrite/TypeWriteRFPhoronix.gif' />
</p>

```
$ rf linux | colorize smart | typewrite
```
<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/TypeWrite/TypeWriteRFLinux.gif' />
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