status report is a command that reports status, either manual or the shell last command return code. status uses profiles to select the report to make effective.


---


<h1>Manual</h1>
```
STATUS(1)                                   User Commands                                   STATUS(1)



NAME
       status - Status Reporter

SYNOPSIS
       status $? [OPTIONS] [PROFILE]

EXAMPLE
       status --visible="job ended" --audible --check $? --code

DESCRIPTION
       status report is a command that reports status, either manual or the shell last command return
       code. status uses profiles to select the report to make effective.

       Mandatory arguments for long options are mandatory for short options too.

       -c, --check=STATUS
              report according to shell exit status

       -c, --code
              show visually shell exit status

       -v, --visible[=MESSAGE]
              set visible report

       -a, --audible[=MESSAGE]
              set audible report

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

       -p, --visible-positive=COLORIZE_MESSAGE
              set visible positive report

       -n, --visible-negative=COLORIZE_MESSAGE
              set visible negative report

       -p, --audible-positive=TONIZE_MESSAGE
              set audible positive report

       -n, --audible-negative=TONIZE_MESSAGE
              set audible negative report

       -t, --terminal
              report only if output is a terminal

       -v, --version
              show the program version

       -v, --variable=VARIABLE
              show a program variable

       -h, --help
              show the program help

       -m, --man
              show the program manual

       By default uses check profile, requiring one argument for shell last command code ($?). Visual
       colorize and audible tonize arguments are understood.

       The  available  --variable  VARIABLES  are:  package, name, version, description, explanation,
       license, homepage, author, email, social, blog, usage, options, examples,  extrahelp,  extran‐
       otes, month, year, day and timestamp.

       Execute 'bash -c "man <(status --man)"' to see the runtime manpage.

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



status 2014.06.07                          Monday July 2014                                 STATUS(1)
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
status (status report) by Juan Manuel Borges Caño licensed GPLv3+ (Monday July 2014)
Status Reporter
Usage: status $? [OPTIONS] [PROFILE]
Example: status --visible="job ended" --audible --check $? --code

status report is a command that reports status, either manual or the shell last command return code. status uses profiles to select the report to make effective.

Mandatory arguments for long options are mandatory for short options too:
  -c, --check=STATUS                            report according to shell exit status
  -c, --code                                    show visually shell exit status
  -v, --visible[=MESSAGE]                       set visible report
  -a, --audible[=MESSAGE]                       set audible report
  -i, --info                                    use info profile
  -w, --warning                                 use warning profile
  -e, --error                                   use error profile
  -p, --profile=PROFILE                         set profile
  -l, --list                                    list profiles
  -p, --visible-positive=COLORIZE_MESSAGE       set visible positive report
  -n, --visible-negative=COLORIZE_MESSAGE       set visible negative report
  -p, --audible-positive=TONIZE_MESSAGE         set audible positive report
  -n, --audible-negative=TONIZE_MESSAGE         set audible negative report
  -t, --terminal                                report only if output is a terminal
  -v, --version                                 show the program version
  -v, --variable=VARIABLE                       show a program variable
  -h, --help                                    show the program help
  -m, --man                                     show the program manual
By default uses check profile, requiring one argument for shell last command code ($?). Visual colorize and audible tonize arguments are understood.
The available --variable VARIABLES are: package, name, version, description, explanation, license, homepage, author, email, social, blog, usage, options, examples, extrahelp, extranotes, month, year, day and timestamp.
Execute 'bash -c "man <(status --man)"' to see the runtime manpage.

status (status report) homepage: http://code.google.com/p/codemiscs.
status (status report) author: Juan Manuel Borges Caño.
status (status report) email: juanmabcmail@gmail.com.
status (status report) social: http://plus.google.com/+JuanManuelBorgesCaño
status (status report) blog: http://juanmabcblog.blogspot.com.
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
Designed To React To Shell Command Exit Status & For Straight Usage On Unattended Long Duration Tasks:

```
$ true; status --visible --audible --check $? --code
job done (0) ((( info colors, 1 beep )))
```

```
$ false; status --visible --audible --check $? --code
job done (127) ((( error colors, 3 beeps )))
```

```
$ cp -rv /home/videos/youtube /mnt/usb/videos/youtube; status --visible --audible --check $? --code
```

```
$ cp -rv /home/books/guttenberg /mnt/usb/books/guttenberg; status --visible --audible --check $? --code
```

```
$ cp -rv /home/music/jamendo /mnt/usb/music/jamendo; status --visible --audible --check $? --code
```

```
$ cp -rv /home/images/flickr /mnt/usb/images/flickr; status --visible --audible --check $? --code
```

```
$ make; status --visible --audible --check $? --code
```

```
$ sleep 360; status --visible --audible --check $? --code
```

Due To The Nature Of Shell Exit Status Has To Be Invoked With $?, But Aliases Are Handy:
```
$ alias status='status --visible --audible --check $? --code'
$ true; status
job done (0) ((( info colors, 1 beep )))
$ false; status
job done (127) ((( error colors, 3 beeps )))
$ make; status
```

Customizable:
```
$ true; status --visible="void task done" --visible-positive smart --visible-negative health --audible --audible-positive phaser --audible-negative fail --check $? --code
```

```
$ false; status --visible="void task done" --visible-positive smart --visible-negative health --audible --audible-positive phaser --audible-negative fail --check $? --code
```

Proved To Be A Bless ;-)
```
$ inefficient command; status --visible --audible --check $? --code # notify me at the patio
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