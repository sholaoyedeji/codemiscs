colorize input is a command that colorizes the input read from standard input. colorize uses profiles to select the color to apply to the input.


---


<h1>Manual</h1>
```
COLORIZE(1)                                 User Commands                                 COLORIZE(1)



NAME
       colorize - Input Tinter

SYNOPSIS
       colorize [OPTIONS] [PROFILE]

EXAMPLE
       colorize --help | colorize --profile help

DESCRIPTION
       colorize  input  is a command that colorizes the input read from standard input. colorize uses
       profiles to select the color to apply to the input.

       Mandatory arguments for long options are mandatory for short options too.

       -f, --foreground=COLOR
              set foreground color

       -b, --background=COLOR
              set background color

       -i, --info
              use info profile

       -w, --warning
              use warning profile

       -e, --error
              use error profile

       -w, --whole
              set whole input

       -l, --line=LINE
              set line pattern

       -m, --match=MATCH
              set match pattern

       -p, --profile=PROFILE
              set profile

       -l, --list
              list profiles

       -t, --terminal
              color only if output is a terminal

       -s, --strip
              remove any color traces

       -v, --version
              show the program version

       -v, --variable=VARIABLE
              show a program variable

       -h, --help
              show the program help

       -m, --man
              show the program manual

       By default sets profile, else uses input profile (green foreground and red background).  Color
       aliases are understood: black (0), red (1), green (2), yellow (3), blue (4), magenta (5), cyan
       (6) and white (7).

       The available --variable VARIABLES are:  package,  name,  version,  description,  explanation,
       license,  homepage,  author, email, social, blog, usage, options, examples, extrahelp, extran‐
       otes, month, year, day and timestamp.

       Execute 'bash -c "man <(colorize --man)"' to see the runtime manpage.

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



colorize 2014.06.07                        Monday July 2014                               COLORIZE(1)
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
colorize (colorize input) by Juan Manuel Borges Caño licensed GPLv3+ (Monday July 2014)
Input Tinter
Usage: colorize [OPTIONS] [PROFILE]
Example: colorize --help | colorize --profile help

colorize input is a command that colorizes the input read from standard input. colorize uses profiles to select the color to apply to the input.

Mandatory arguments for long options are mandatory for short options too:
  -f, --foreground=COLOR                        set foreground color
  -b, --background=COLOR                        set background color
  -i, --info                                    use info profile
  -w, --warning                                 use warning profile
  -e, --error                                   use error profile
  -w, --whole                                   set whole input
  -l, --line=LINE                               set line pattern
  -m, --match=MATCH                             set match pattern
  -p, --profile=PROFILE                         set profile
  -l, --list                                    list profiles
  -t, --terminal                                color only if output is a terminal
  -s, --strip                                   remove any color traces
  -v, --version                                 show the program version
  -v, --variable=VARIABLE                       show a program variable
  -h, --help                                    show the program help
  -m, --man                                     show the program manual
By default sets profile, else uses input profile (green foreground and red background). Color aliases are understood: black (0), red (1), green (2), yellow (3), blue (4), magenta (5), cyan (6) and white (7).
The available --variable VARIABLES are: package, name, version, description, explanation, license, homepage, author, email, social, blog, usage, options, examples, extrahelp, extranotes, month, year, day and timestamp.
Execute 'bash -c "man <(colorize --man)"' to see the runtime manpage.

colorize (colorize input) homepage: http://code.google.com/p/codemiscs.
colorize (colorize input) author: Juan Manuel Borges Caño.
colorize (colorize input) email: juanmabcmail@gmail.com.
colorize (colorize input) social: http://plus.google.com/+JuanManuelBorgesCaño
colorize (colorize input) blog: http://juanmabcblog.blogspot.com.
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
Supports Straight Color Assignments And Aliases (frontend for the complexity of terminal handling):

```
$ echo "Text" | colorize --background green --foreground yellow
```
<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/Colorize/ColorizeTextCustom.png' />
</p>

```
$ cat ./README | colorize --background blue --foreground green
```
<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/Colorize/ColorizeFileCustom.png' />
</p>

Prettifies Message Logging levels:

```
$ echo "This is an error" | colorize --error
```
<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/Colorize/ColorizeError.png' />
</p>

```
$ echo "This is a warning" | colorize --warning
```
<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/Colorize/ColorizeWarning.png' />
</p>

```
$ echo "This is a message" | colorize --info
```
<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/Colorize/ColorizeInfo.png' />
</p>

Highlights Lines & Patterns:
```
$ echo -e "When done." | colorize --match done --info
```

```
$ echo -e "When\nerror" | colorize --line error --error
```

Increases Readability:

```
$ cat file | colorize smart | less
```
<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/Colorize/ColorizeSmart.png' />
n</p>

Has A Wide List Of Profiles:

```
$ colorize --list
input
help
info
warning
error
punctuation
vivid
smart
elegant
minimalist
sharp
awesome
fancy
cool
health
relax
heaven
strong
reverse
hidden
raw
bold
reverse
```

Help Profile Extends To External Commands:

```
$ grep --help | colorize help
```
<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/Colorize/ColorizeGREPHelp.png' />
</p>

```
$ ls --help | colorize help
```
<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/Colorize/ColorizeLSHelp.png' />
</p>

```
$ cp --help | colorize help
```
<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/Colorize/ColorizeCPHelp.png' />
</p>

```
$ mv --help | colorize help
```
<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/Colorize/ColorizeMVHelp.png' />
</p>

```
$ colorize --help
```
<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/Colorize/ColorizeHelp.png' />
</p>

And Has Some Extras:
```
$ echo "Emphatize This" | colorize bold
```
<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/Colorize/ColorizeBold.png' />
</p>

```
$ echo "Remark This" | colorize reverse
```
<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/Colorize/ColorizeReverse.png' />
</p>

```
$ echo "Remove Color Codes" | colorize elegant | colorize --strip
...
```

```
$ echo "Insert Color Codes Only On Screens" | colorize --terminal > file
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