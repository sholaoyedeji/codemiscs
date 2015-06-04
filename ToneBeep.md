tone beeper is a command that tones according to a selected profile, the input read from standard input or from a file.


---


<h1>Manual</h1>
```
TONIZE(1)                                   User Commands                                   TONIZE(1)



NAME
       tonize - Internal Speaker Tone Beeper

SYNOPSIS
       tonize [OPTIONS] [PROFILE]

EXAMPLE
       tonize beep

DESCRIPTION
       tone beeper is a command that tones according to a selected profile, the input read from stan‐
       dard input or from a file.

       Mandatory arguments for long options are mandatory for short options too.

       -t, --tone=TONE
              set tone

       -n, --note=NOTE
              set note

       -f, --frequency=FREQUENCY
              set frequency

       -t, --time=TIME
              set time

       -d, --delay=DELAY
              set delay

       -r, --repeats=TIMES
              set repeats

       -i, --info
              use info profile

       -w, --warning
              use warning profile

       -e, --error
              use error profile

       -p, --profile=PROFILE
              set profile

       -l, --list
              list profiles

       -t, --terminal
              tone only if output is a terminal

       -p, --print
              only print command

       -v, --version
              show the program version

       -v, --variable=VARIABLE
              show a program variable

       -h, --help
              show the program help

       -m, --man
              show the program manual

       By default sets profile, else uses input profile (beep tone,  one second time, no  delay,  one
       repeat). Tone aliases are understood: do/c, re/d, mi/e, fa/f, sol/g, la/a , si/b (6) and beep.

       The  available  --variable  VARIABLES  are:  package, name, version, description, explanation,
       license, homepage, author, email, social, blog, usage, options, examples,  extrahelp,  extran‐
       otes, month, year, day and timestamp.

       Execute 'bash -c "man <(tonize --man)"' to see the runtime manpage.

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



tonize 2014.06.07                          Monday July 2014                                 TONIZE(1)
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
tonize (tone beep) by Juan Manuel Borges Caño licensed GPLv3+ (Monday July 2014)
Internal Speaker Tone Beeper
Usage: tonize [OPTIONS] [PROFILE]
Example: tonize beep

tone beeper is a command that tones according to a selected profile, the input read from standard input or from a file.

Mandatory arguments for long options are mandatory for short options too:
  -t, --tone=TONE                               set tone
  -n, --note=NOTE                               set note
  -f, --frequency=FREQUENCY                     set frequency
  -t, --time=TIME                               set time
  -d, --delay=DELAY                             set delay
  -r, --repeats=TIMES                           set repeats
  -i, --info                                    use info profile
  -w, --warning                                 use warning profile
  -e, --error                                   use error profile
  -p, --profile=PROFILE                         set profile
  -l, --list                                    list profiles
  -t, --terminal                                tone only if output is a terminal
  -p, --print                                   only print command
  -v, --version                                 show the program version
  -v, --variable=VARIABLE                       show a program variable
  -h, --help                                    show the program help
  -m, --man                                     show the program manual
By default sets profile, else uses input profile (beep tone,  one second time, no delay, one repeat). Tone aliases are understood: do/c, re/d, mi/e, fa/f, sol/g, la/a , si/b (6) and beep.
The available --variable VARIABLES are: package, name, version, description, explanation, license, homepage, author, email, social, blog, usage, options, examples, extrahelp, extranotes, month, year, day and timestamp.
Execute 'bash -c "man <(tonize --man)"' to see the runtime manpage.

tonize (tone beep) homepage: http://code.google.com/p/codemiscs.
tonize (tone beep) author: Juan Manuel Borges Caño.
tonize (tone beep) email: juanmabcmail@gmail.com.
tonize (tone beep) social: http://plus.google.com/+JuanManuelBorgesCaño
tonize (tone beep) blog: http://juanmabcblog.blogspot.com.
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
Designed For Straight Usage On Noticeable Tasks:
```
$ mail -e && tonize ring
```

```
$ sleep 360; tonize phaser
```

Composition Support Of Straight Notes Assignments And Aliases (frontend for the complexity of frequencies handling):

```
$ echo "do" | tonize composer
$ echo "c" | tonize composer
```

```
$ cat <<EOF | tonize composer
do
re
mi
fa
sol
la
si
c2 3 # (do2 coming)
EOF
```

Audifies Message Logging Levels:

```
$ echo "This is an error" | colorize error && tonize error
```

```
$ echo "This is a warning" | colorize warning && tonize warning
```

```
$ echo "This is a message" | colorize info && tonize info
```

Increases File Audibility ;-):

```
$ cat file | colorize smart | tonize input
```

Has A Wide List Of Profiles:

```
$ tonize --list
beep
composer
info
warning
error
success
trouble
failure
victory
problem
fail
input
phaser
ring
cash
smart
vivid
sharp
fancy
cool
health
strong
reverse
hidden
raw
bold
```

Midi Profile Extends To External Formats (In Progress, See Show):

```
$ cat ./tune.midi | tonize midi
```

And Has Some Extras:
```
$ echo "Don't beep when piped" | tonize --terminal > file
...
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